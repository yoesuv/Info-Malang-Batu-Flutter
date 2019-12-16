import 'package:flutter/material.dart';
import '../screens/splash.dart';
import '../screens/home.dart';
import '../screens/list_place_detail.dart';
import '../screens/gallery_detail.dart';
import '../models/list_place/item_place_model.dart';
import '../models/gallery/item_gallery_model.dart';

class Routes{

    static Route routes(RouteSettings settings) {
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
