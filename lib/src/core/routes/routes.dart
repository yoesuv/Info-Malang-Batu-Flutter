import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/splash_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/splash_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/home.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place_detail.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/splash.dart';

class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => SplashBloc()..add(SplashEventInit()),
            child: Splash(),
          );
        },
      );
    } else if (settings.name == Home.routeHome) {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return const Home();
        },
      );
    } else if (settings.name == ListPlaceDetail.routeName) {
      final ItemPlaceModel model = settings.arguments as ItemPlaceModel;
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return ListPlaceDetail(itemPlaceModel: model);
        },
      );
    } else if (settings.name == GalleryDetail.routeName) {
      final model = settings.arguments as ItemGalleryModel;
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return GalleryDetail(itemGalleryModel: model);
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Screen Not Found',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
