import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/new_maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/list_item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/src/provider.dart';

class MapsPlace extends StatefulWidget {
  const MapsPlace({Key? key}) : super(key: key);

  @override
  _MapsPlaceState createState() => _MapsPlaceState();
}

class _MapsPlaceState extends State<MapsPlace> {
  late NewMapsBloc _bloc;
  late GoogleMapController googleMapController;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<NewMapsBloc>()..add(MapsEventInit(context: context));
  }

  @override
  Widget build(BuildContext context) {
    //checkLocationService();
    return Scaffold(
      appBar: AppBar(title: const MyAppBarText(title: 'Peta'), actions: <Widget>[_iconRefresh()]),
      body: _buildMaps(),
    );
  }

  Widget _iconRefresh() {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(defaultLatitude, defaultLongitude), zoom: defaultZoom),
          ),
        );
      },
    );
  }

  Widget _buildMaps() {
    return BlocBuilder<NewMapsBloc, MapsState>(
      bloc: _bloc,
      builder: (context, MapsState state) {
        return GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
          initialCameraPosition: CameraPosition(target: LatLng(defaultLatitude, defaultLongitude), zoom: defaultZoom),
          compassEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: Set<Marker>.of(state.listMarker ?? []),
        );
      },
    );
  }

  void checkLocationService() {
    mapsBloc.checkLocationService().then((bool result) {
      if (!result) {
        showSnackBarError(context, 'Location Service is Disabled');
      } else {
        checkLocationPermission();
      }
    });
  }

  void checkLocationPermission() {
    mapsBloc.checkLocationPermission().then((bool result) {
      if (!result) {
        mapsBloc.requestLocationPermission().then((PermissionStatus status) {
          if (status == PermissionStatus.granted) {
            showSnackBarSuccess(context, 'Location Permission Granted');
          } else if (status == PermissionStatus.permanentlyDenied) {
            openAppSettings();
          } else {
            showSnackBarError(context, 'Location Permission Denied');
          }
        });
      }
    });
  }

  Widget buildMaps(BitmapDescriptor icon) {
    return Container();
    /*return StreamBuilder<ServiceModel<ListItemMapsPinModel>>(
      stream: homeBloc.streamListItemMapsPins,
      builder: (BuildContext context, AsyncSnapshot<ServiceModel<ListItemMapsPinModel>> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data?.status) {
            case Status.COMPLETED:
            //generate marker
              final List<Marker> listMarker = <Marker>[];
              snapshot.data?.data?.listItemGalleryModel.asMap().forEach((int index, ItemMapsPinModel pin){
                listMarker.add(Marker(
                    markerId: MarkerId(pin.name),
                    position: LatLng(pin.latitude, pin.longitude),
                    infoWindow: InfoWindow(title: pin.name),
                    icon: icon
                ));
              });

              return GoogleMap (
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                      target: LatLng(defaultLatitude, defaultLongitude),
                      zoom: defaultZoom
                  ),
                  compassEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: Set<Marker>.of(listMarker)
              );
            case Status.DIOERROR:
              return Center(
                  child: Text(snapshot.data?.error?.dioError?.message ?? '')
              );
            case Status.ERROR:
              return Center(
                  child: Text(snapshot.data?.message ?? '')
              );
            default:
              break;
          }
        }
        return const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
            )
        );
      },
    );*/
  }

  // create custom marker icon
  Widget createMarker() {
    return FutureBuilder<BitmapDescriptor>(
        future: createIcons(),
        builder: (BuildContext context, AsyncSnapshot<BitmapDescriptor> snapshot) {
          if (snapshot.hasData) {
            return buildMaps(snapshot.data!);
          } else {
            return Container();
          }
        });
  }

  Future<BitmapDescriptor> createIcons() {
    return BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context, size: const Size(64.0, 64.0)), iconMarker);
  }
}
