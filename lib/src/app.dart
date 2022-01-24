import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ListPlaceBloc>(create: (context) => ListPlaceBloc()),
          //BlocProvider<AboutBloc>(create: (context) => AboutBloc()),
        ],
        child: MaterialApp(
            title: 'Info Malang Batu',
            theme: ThemeData(
              primaryColor: Colors.teal,
              accentColor: Colors.white,
              primarySwatch: Colors.teal,
            ),
            onGenerateRoute: Routes.routes));
  }
}
