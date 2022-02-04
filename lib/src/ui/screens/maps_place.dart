import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/new_maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';
import 'package:permission_handler/permission_handler.dart';

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
    _checkLocationService();
  }

  @override
  Widget build(BuildContext context) {
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
          myLocationEnabled: state.isPermissionLocationEnabled ?? false,
          myLocationButtonEnabled: state.isPermissionLocationEnabled ?? false,
          markers: Set<Marker>.of(state.listMarker ?? []),
        );
      },
    );
  }

  void _checkLocationService() {
    _bloc.checkLocationService().then((result) => {
      if (result) {
        _checkPermissionLocation()
      } else {
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          showSnackBarError(context, 'Location Service is Disabled');
        })
      }
    });
  }

  void _checkPermissionLocation() {
    _bloc.isPermissionLocationGranted().then((granted) => {
      if (!granted) {
        _bloc.requestLocationPermission().then((PermissionStatus status) => {
          if (status == PermissionStatus.granted) {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              showSnackBarSuccess(context, 'Location Permission Granted');
            })
          } else if (status == PermissionStatus.permanentlyDenied) {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              showSnackBarWarning(context, 'Open App Setting');
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: const Text('Permission', style: TextStyle(fontSize: 16)),
                  content: const Text('Open app settings to allow permission', style: TextStyle(fontSize: 14)),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text('Cancel', style: TextStyle(fontSize: 14))),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      openAppSettings();
                    }, child: const Text('OK', style: TextStyle(fontSize: 14))),
                  ],
                );
              });
            })
          } else if (status == PermissionStatus.denied) {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              showSnackBarError(context, 'Location Permission Denied');
            })
          } else {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              showSnackBarError(context, 'Location Permission Denied');
            })
          }
        })
      }
    });
  }

}
