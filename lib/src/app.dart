import 'package:flutter/material.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/list_place_bloc.dart';
import 'blocs/list_gallery_bloc.dart';
import 'blocs/maps_bloc.dart';
import 'blocs/about_bloc.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {

    Widget build(BuildContext context) {
        return BlocProvider (
            bloc: ListPlaceBloc(),
            child: BlocProvider (
                bloc: ListGalleryBloc(),
                child: BlocProvider (
                    bloc: MapsBloc(),
                    child: BlocProvider (
                        bloc: AboutBloc(),
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
