import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../blocs/maps_provider.dart';
import '../models/list_item_maps_pin_model.dart';
import '../data/constants.dart';

class MapsPlace extends StatelessWidget {

    Widget build(BuildContext context) {

        final MapsBloc bloc = MapsProvider.of(context);
        bloc.checkLocationPermission();

        return Scaffold (
            appBar: AppBar (
                title: Text('Maps')
            ),
            body: StreamBuilder(
                stream: bloc.permissionStatus,
                builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
                    if (snapshot.hasData) {
                        if (snapshot.data != PermissionStatus.granted) {
                            bloc.requestLocationPermission();
                            return requestLocationPermission(bloc);
                        } else {
                            bloc.getListMapsPin();
                            return buildMaps(bloc);
                        }
                    } else {
                        return Center (
                            child: Text('Loading Maps...')
                        );
                    }
                }
            )
        );
    }


    Widget requestLocationPermission(MapsBloc bloc) {
        return StreamBuilder(
            stream: bloc.requestLocationPermissionResult,
            builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
                if (snapshot.hasData) {
                    bloc.getListMapsPin();
                    return buildMaps(bloc);
                } else {
                    return Center(
                        child: Text('Checking Location Permission')
                    );
                }
            }
        );
    }

    Widget buildMaps(MapsBloc bloc) {
        return StreamBuilder (
            stream: bloc.listItemMapsPins,
            builder: (BuildContext context, AsyncSnapshot<ListItemMapsPinModel> snapshot) {
                if (snapshot.hasData) {
                    //generate marker
                    List<Marker> listMarker = [];
                    snapshot.data.listItemGalleryModel.forEach((pin) {
                        listMarker.add(Marker(
                            markerId: MarkerId(pin.name),
                            position: LatLng(pin.latitude, pin.longitude)
                        ));
                    });

                    return GoogleMap (
                        initialCameraPosition: CameraPosition(
                            target: LatLng(-7.982914, 112.630875),
                            zoom: 9.0
                        ),
                        compassEnabled: true,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        markers: Set<Marker>.of(listMarker)
                    );
                } else {
                    return Center(
                        child: CircularProgressIndicator()
                    );
                }
            }
        );
    }

    Future<BitmapDescriptor> createIcons(BuildContext context) {
        return BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context), Constants.iconMarker);
    }

}
