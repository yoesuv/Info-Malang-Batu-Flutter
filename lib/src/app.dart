import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'screens/home.dart';
import 'screens/list_place_detail.dart';
import 'screens/gallery_detail.dart';
import 'blocs/list_place_provider.dart';
import 'blocs/list_gallery_provider.dart';
import 'blocs/maps_provider.dart';
import 'blocs/about_provider.dart';
import 'models/list_place/item_place_model.dart';
import 'models/gallery/item_gallery_model.dart';

class App extends StatelessWidget {

    Widget build(BuildContext context) {
        return ListPlaceProvider (
            child: ListGalleryProvider (
                child: MapsProvider (
                    child: AboutProvider (
                        child: MaterialApp (
                            title: 'Info Malang Batu',
                            theme: ThemeData(
                                primaryColor: Colors.teal,
                                accentColor: Colors.white
                            ),
                            onGenerateRoute: routes
                        )
                    )
                )
            )
        );
    }

    Route routes(RouteSettings settings) {
        print('App # ${settings.name}');
        if (settings.name == '/') {
            return MaterialPageRoute(
                builder: (context) {
                    return Splash();
                }
            );
        } else if (settings.name == Home.routeHome) {
            return MaterialPageRoute(
                builder: (context) {
                    return Home();
                }
            );
        } else if (settings.name == ListPlaceDetail.routeListPlaceDetail) {
            final ItemPlaceModel model = settings.arguments;
            return MaterialPageRoute(
                builder: (context) {
                    return ListPlaceDetail(itemPlaceModel: model);
                }
            );
        } else {
            final ItemGalleryModel model = settings.arguments;
            return MaterialPageRoute(
                builder: (context) {
                    return GalleryDetail(itemGalleryModel: model);
                }
            );
        }
    }

}
