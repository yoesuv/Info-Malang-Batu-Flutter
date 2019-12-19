import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocs/list_place_bloc.dart';
import 'blocs/list_gallery_bloc.dart';
import 'blocs/maps_bloc.dart';
import 'blocs/about_bloc.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {

    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                Provider<ListPlaceBloc>(create: (_) => ListPlaceBloc()),
                Provider<ListGalleryBloc>(create: (_) => ListGalleryBloc()),
                Provider<MapsBloc>(create: (_) => MapsBloc()),
                Provider<AboutBloc>(create: (_) => AboutBloc())
            ],
            child: MaterialApp (
                title: 'Info Malang Batu',
                theme: ThemeData(
                    primaryColor: Colors.teal,
                    accentColor: Colors.white
                ),
                onGenerateRoute: Routes.routes
            )
        );

    }

}
