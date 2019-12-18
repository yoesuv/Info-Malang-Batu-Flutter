import 'package:flutter/material.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/list_place_bloc.dart';
import 'blocs/list_gallery_provider.dart';
import 'blocs/maps_provider.dart';
import 'blocs/about_provider.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {

    Widget build(BuildContext context) {
        return BlocProvider (
            bloc: ListPlaceBloc(),
            child: ListGalleryProvider (
                child: MapsProvider (
                    child: AboutProvider (
                        child: MaterialApp (
                            title: 'Info Malang Batu',
                            theme: ThemeData(
                                primaryColor: Colors.teal,
                                accentColor: Colors.white
                            ),
                            onGenerateRoute: Routes.routes
                        )
                    )
                )
            )
        );
    }

}
