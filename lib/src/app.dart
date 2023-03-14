import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/gallery_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListPlaceBloc>(create: (context) => ListPlaceBloc()),
        BlocProvider<GalleryBloc>(create: (context) => GalleryBloc()),
        BlocProvider<MapsBloc>(create: (context) => MapsBloc()),
      ],
      child: MaterialApp(
        title: 'Info Malang Batu',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.teal,
            secondary: Colors.teal,
          ),
          tabBarTheme: const TabBarTheme(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 2),
            )
          ),
        ),
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
