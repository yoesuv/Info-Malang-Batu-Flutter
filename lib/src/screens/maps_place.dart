import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_malang_batu_flutter/src/blocs/home_bloc.dart';
import 'package:info_malang_batu_flutter/src/widgets/my_app_bar_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../blocs/maps_bloc.dart';
import '../data/constants.dart';
import '../models/maps/item_maps_pin_model.dart';
import '../models/maps/list_item_maps_pin_model.dart';
import '../models/service_model.dart';

class MapsPlace extends StatefulWidget {

    @override
    MapsPlaceState createState() => MapsPlaceState();

}

class MapsPlaceState extends State<MapsPlace>{

    GoogleMapController googleMapController;
    HomeBloc homeBloc;
    MapsBloc bloc = MapsBloc();

    @override
  void initState() {
    super.initState();
    homeBloc = Provider.of<HomeBloc>(context, listen: false);
  }

    @override
    Widget build(BuildContext context) {
        bloc.checkLocationPermission();
        return Scaffold (
            appBar: AppBar (
                title: const MyAppBarText(title: 'Peta'),
                actions: <Widget>[
                    IconButton(
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
                    )
                ]
            ),
            body: StreamBuilder<PermissionStatus>(
                stream: bloc.permissionStatus,
                builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
                    if (snapshot.hasData) {
                        if (snapshot.data != PermissionStatus.granted) {
                            bloc.requestLocationPermission();
                            return requestLocationPermission(context, bloc);
                        } else {
                            return createMarker(context);
                        }
                    } else {
                        return const Center (
                            child: Text('Loading Maps...')
                        );
                    }
                }
            )
        );
    }

    Widget requestLocationPermission(BuildContext context, MapsBloc bloc) {
        return StreamBuilder<PermissionStatus>(
            stream: bloc.requestLocationPermissionResult,
            builder: (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
                if (snapshot.hasData) {
                    return createMarker(context);
                } else {
                    return const Center(
                        child: Text('Checking Location Permission')
                    );
                }
            }
        );
    }

    // create custom marker icon
    Widget createMarker(BuildContext context) {
        return FutureBuilder<BitmapDescriptor>(
            future: createIcons(context),
            builder: (BuildContext context, AsyncSnapshot<BitmapDescriptor> snapshot) {
                if (snapshot.hasData) {
                    final BitmapDescriptor ico = snapshot.data;
                    homeBloc.getListMapsPin();
                    return buildMaps(ico);
                } else {
                    return const Center(
                        child: Text('Loading Markers...')
                    );
                }
            }
        );
    }

    Widget buildMaps(BitmapDescriptor iconMarker) {
        return StreamBuilder<ServiceModel<ListItemMapsPinModel>> (
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
                                    icon: iconMarker
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
        return BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context, size: const Size(64.0, 64.0)) , iconMarker);
    }

    @override
    void dispose(){
        bloc.dispose();
        super.dispose();
    }

}