import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPlace extends StatelessWidget {

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Maps')
            ),
            body: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(-7.982914, 112.630875),
                    zoom: 9.0
                ),
                compassEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
            )
        );
    }

}
