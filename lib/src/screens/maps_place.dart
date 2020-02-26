import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_malang_batu_flutter/src/blocs/home_bloc.dart';
import 'package:info_malang_batu_flutter/src/widgets/my_app_bar_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';
import 'package:info_malang_batu_flutter/src/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/models/maps/item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/models/maps/list_item_maps_pin_model.dart';
import 'package:info_malang_batu_flutter/src/models/service_model.dart';

class MapsPlace extends StatefulWidget {

  @override
  MapsPlaceState createState() => MapsPlaceState();

}

class MapsPlaceState extends State<MapsPlace>{

  GoogleMapController googleMapController;
  HomeBloc homeBloc;
  List<Marker> listMarker = <Marker>[];

  @override
  void initState() {
    super.initState();
    listMarker.clear();
    homeBloc = Provider.of<HomeBloc>(context, listen: false);
    homeBloc.getListMapsPin();
  }

  @override
  Widget build(BuildContext context) {
    checkLocationService();
    return Scaffold (
        appBar: AppBar (
          title: const MyAppBarText(title: 'Peta'),
          actions: <Widget>[iconRefresh()]
        ),
        body: createMarker()
    );
  }

  Widget iconRefresh() {
    return IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(defaultLatitude, defaultLongitude),
                      zoom: defaultZoom
                  )
              )
          );
        }
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
          } else if (status == PermissionStatus.neverAskAgain) {
            showSnackBarWarning(context, 'Open App Setting');
            PermissionHandler().openAppSettings();
          } else {
            showSnackBarError(context, 'Location Permission Denied');
          }
        });
      }
    });
  }

  Widget buildMaps(BitmapDescriptor icon) {
    return StreamBuilder<ServiceModel<ListItemMapsPinModel>>(
      stream: homeBloc.streamListItemMapsPins,
      builder: (BuildContext context, AsyncSnapshot<ServiceModel<ListItemMapsPinModel>> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.COMPLETED:
            //generate marker
              final List<Marker> listMarker = <Marker>[];
              snapshot.data.data.listItemGalleryModel.asMap().forEach((int index, ItemMapsPinModel pin){
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
              break;
            case Status.DIOERROR:
              return Center(
                  child: Text(snapshot.data.error.dioError.message)
              );
              break;
            case Status.ERROR:
              return Center(
                  child: Text(snapshot.data.message)
              );
              break;
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
    );
  }

  // create custom marker icon
  Widget createMarker() {
    return FutureBuilder<BitmapDescriptor>(
        future: createIcons(),
        builder: (BuildContext context, AsyncSnapshot<BitmapDescriptor> snapshot) {
          if (snapshot.hasData) {
            return buildMaps(snapshot.data);
          } else {
            return Container();
          }
        }
    );
  }

  Future<BitmapDescriptor> createIcons() {
    return BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context, size: const Size(64.0, 64.0)) , iconMarker);
  }

}