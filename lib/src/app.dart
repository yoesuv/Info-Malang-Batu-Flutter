import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'blocs/list_place_provider.dart';

class App extends StatelessWidget {

    Widget build(BuildContext context) {
        return ListPlaceProvider(
            child: MaterialApp(
                title: 'Info Malang Batu',
                home: Home()
            )
        );
    }

}
