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
    _bloc = context.read<NewMapsBloc>();
    _bloc.add(MapsCheckServiceLocation());
    _bloc.add(MapsEventInit(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyAppBarText(title: 'Peta'),
        actions: <Widget>[_iconRefresh()],
      ),
      body: BlocListener<NewMapsBloc, MapsState>(
        bloc: _bloc,
        listenWhen: (prev, current) {
          return prev.locationService != current.locationService ||
              prev.permissionStatus != current.permissionStatus;
        },
        listener: (context, state) {
          if (state.locationService == false) {
            showSnackBarError(context, 'Location Service is Disabled');
          } else {
            _bloc.add(MapsEventPermissionLocation());
          }
          if (state.permissionStatus == PermissionStatus.granted) {
            showSnackBarSuccess(context, 'Location Permission Granted');
          } else if (state.permissionStatus == PermissionStatus.denied) {
            showSnackBarError(context, 'Location Permission Denied');
          } else if (state.permissionStatus ==
              PermissionStatus.permanentlyDenied) {
            showSnackBarWarning(context, 'Open App Setting');
          }
        },
        child: _buildMaps(),
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

  Widget _buildMaps() {
    return BlocBuilder<NewMapsBloc, MapsState>(
      bloc: _bloc,
      buildWhen: (previous, current) {
        return previous.listMarker != current.listMarker ||
            previous.permissionStatus != previous.permissionStatus ||
            previous.locationService != current.locationService;
      },
      builder: (context, MapsState state) {
        final status = state.permissionStatus == PermissionStatus.granted;
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
          markers: Set<Marker>.of(state.listMarker ?? []),
        );
      },
    );
  }
}
