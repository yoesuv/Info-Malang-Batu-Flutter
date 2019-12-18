import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../blocs/maps_provider.dart';
import '../models/maps/list_item_maps_pin_model.dart';
import '../models/service_model.dart';
import '../data/constants.dart';

class MapsPlace extends StatelessWidget {

    Widget build(BuildContext context) {

        final MapsBloc bloc = MapsProvider.of(context);
        bloc.checkLocationPermission();

        return Scaffold (
            appBar: AppBar (
                title: Text('Peta', style: TextStyle(
                    fontFamily: 'Pacifico'
                ))
            ),
            body: StreamBuilder(
                stream: bloc.permissionStatus,
                builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
                    if (snapshot.hasData) {
                        if (snapshot.data != PermissionStatus.granted) {
                            bloc.requestLocationPermission();
                            return requestLocationPermission(context, bloc);
                        } else {
                            return createMarker(context, bloc);
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


    Widget requestLocationPermission(BuildContext context, MapsBloc bloc) {
        return StreamBuilder(
            stream: bloc.requestLocationPermissionResult,
            builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
                if (snapshot.hasData) {
                    return createMarker(context, bloc);
                } else {
                    return Center(
                        child: Text('Checking Location Permission')
                    );
                }
            }
        );
    }

    // create custom marker icon
    Widget createMarker(BuildContext context, MapsBloc bloc) {
        return FutureBuilder(
            future: createIcons(context),
            builder: (context, AsyncSnapshot<BitmapDescriptor> snapshot) {
                if (snapshot.hasData) {
                    BitmapDescriptor ico = snapshot.data;
                    bloc.getListMapsPin();
                    return buildMaps(bloc, ico);
                } else {
                    return Center(
                        child: Text('Loading Markers...')
                    );
                }

            }
        );
    }

    Widget buildMaps(MapsBloc bloc, BitmapDescriptor iconMarker) {
        return StreamBuilder (
            stream: bloc.listItemMapsPins,
            builder: (BuildContext context, AsyncSnapshot<ServiceModel<ListItemMapsPinModel>> snapshot) {
                if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                        case Status.COMPLETED:
                            //generate marker
                            List<Marker> listMarker = [];
                            snapshot.data.data.listItemGalleryModel.forEach((pin) {
                                listMarker.add(Marker(
                                    markerId: MarkerId(pin.name),
                                    position: LatLng(pin.latitude, pin.longitude),
                                    infoWindow: InfoWindow(title: pin.name),
                                    icon: iconMarker
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
                        break;
                        case Status.ERROR:
                            return Center(
                                child: Text(snapshot.data.message)
                            );
                        break;
                        case Status.DIOERROR:
                            return Center(
                                child: Text(snapshot.data.error.dioError.message)
                            );
                        break;
                    }
                }
                return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
                    )
                );

            }
        );
    }

    Future<BitmapDescriptor> createIcons(BuildContext context) {
        return BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context, size: Size(64.0, 64.0)) , Constants.iconMarker);
    }

}
