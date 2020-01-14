import 'package:flutter/material.dart';
import '../models/gallery/item_gallery_model.dart';
import '../models/list_place/item_place_model.dart';
import '../screens/gallery_detail.dart';
import '../screens/home.dart';
import '../screens/list_place_detail.dart';
import '../screens/splash.dart';

class Routes{

    static Route<dynamic> routes(RouteSettings settings) {
        if (settings.name == '/') {
            return MaterialPageRoute<dynamic>(
                builder: (BuildContext context) {
                    return Splash();
                }
            );
        } else if (settings.name == Home.routeHome) {
            return MaterialPageRoute<dynamic>(
                builder: (BuildContext context) {
                    return const Home();
                }
            );
        } else if (settings.name == ListPlaceDetail.routeListPlaceDetail) {
            final ItemPlaceModel model = settings.arguments as ItemPlaceModel;
            return MaterialPageRoute<dynamic>(
                builder: (BuildContext context) {
                    return ListPlaceDetail(itemPlaceModel: model);
                }
            );
        } else {
            final ItemGalleryModel model = settings.arguments as ItemGalleryModel;
            return MaterialPageRoute<dynamic>(
                builder: ( BuildContext context) {
                    return GalleryDetail(itemGalleryModel: model);
                }
            );
        }
    }

}
