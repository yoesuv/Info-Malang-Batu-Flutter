import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/gallery_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/maps_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_gallery_repository_impl.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_place_repository_impl.dart';
import 'package:info_malang_batu_flutter/src/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListPlaceBloc>(create: (context) => ListPlaceBloc(ListPlaceRepositoryImpl())),
        BlocProvider<GalleryBloc>(create: (context) => GalleryBloc(ListGalleryRepositoryImpl())),
        BlocProvider<MapsBloc>(create: (context) => MapsBloc()),
      ],
      child: MaterialApp(
        title: 'Info Malang Batu',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            onSecondary: Colors.teal,
            surface: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            backgroundColor: Colors.teal,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
          ),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
