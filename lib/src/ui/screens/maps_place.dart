import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/new_maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/maps_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/maps_state.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';

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
        debugPrint('MapsPlace # location service ${state.isLocationServiceEnabled}');
        if (state.isChecking != null) {
          if (state.isChecking == true) {
            if (state.isLocationServiceEnabled != null) {
              if (state.isLocationServiceEnabled == false) {
                WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                  showSnackBarError(context, 'Location Service is Disabled');
                });
              } else {
                // check location permission
                if (state.isLocationPermissionGranted == false) {

                }
              }
            }
          }
        }

        return const Center(
          child: Text('This is Maps'),
        );
        /*return GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
          initialCameraPosition: CameraPosition(target: LatLng(defaultLatitude, defaultLongitude), zoom: defaultZoom),
          compassEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: Set<Marker>.of(state.listMarker ?? []),
        );*/
      },
    );
  }

}
