import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsPlace extends StatefulWidget {
  const MapsPlace({super.key});

  @override
  State createState() => _MapsPlaceState();
}

class _MapsPlaceState extends State<MapsPlace> {
  late MapsBloc _bloc;
  late GoogleMapController googleMapController;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<MapsBloc>();
    _bloc.add(MapsEventInit());
    _bloc.add(MapsCheckServiceLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyAppBarText(title: 'Peta'),
        actions: <Widget>[_iconRefresh()],
      ),
      body: BlocListener<MapsBloc, MapsState>(
        bloc: _bloc,
        listenWhen: (prev, current) {
          return prev.locationService != current.locationService ||
              prev.permissionStatus != current.permissionStatus;
        },
        listener: (context, state) {
          final stsPermission = state.permissionStatus;
          if (state.locationService == false) {
            showSnackBarError(context, 'Location Service is Disabled');
          } else {
            _bloc.add(MapsEventPermissionLocation());
          }
          if (stsPermission != null) {
            if (stsPermission.isGranted) {
              showSnackBarSuccess(context, 'Location Permission Granted');
            } else if (stsPermission.isDenied) {
              showSnackBarError(context, 'Location Permission Denied');
            } else if (stsPermission.isPermanentlyDenied) {
              showSnackBarWarning(context, 'Open App Setting');
            }
          }
        },
        child: FutureBuilder<BitmapDescriptor>(
          future: BitmapDescriptor.asset(
            createLocalImageConfiguration(context, size: const Size(36, 36)),
            iconMarker,
          ),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final icon = snapshot.data!;
              return _buildMaps(icon);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _iconRefresh() {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(defaultLatitude, defaultLongitude),
              zoom: defaultZoom,
            ),
          ),
        );
      },
    );
  }

  Widget _buildMaps(BitmapDescriptor icon) {
    return BlocBuilder<MapsBloc, MapsState>(
      bloc: _bloc,
      buildWhen: (previous, current) {
        return previous.permissionStatus != previous.permissionStatus ||
            previous.locationService != current.locationService ||
            previous.listPin != current.listPin;
      },
      builder: (context, state) {
        final status = state.permissionStatus == PermissionStatus.granted;
        final List<Marker> listMarker = <Marker>[];
        state.listPin?.forEach((pin) {
          listMarker.add(
            Marker(
              markerId: MarkerId(pin.name),
              position: LatLng(pin.latitude, pin.longitude),
              infoWindow: InfoWindow(title: pin.name),
              icon: icon,
            ),
          );
        });
        return GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(defaultLatitude, defaultLongitude),
            zoom: defaultZoom,
          ),
          compassEnabled: true,
          myLocationEnabled: status,
          myLocationButtonEnabled: status,
          markers: Set<Marker>.of(listMarker),
        );
      },
    );
  }
}
