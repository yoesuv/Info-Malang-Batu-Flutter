import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';

sealed class AppRoute {
  const AppRoute();
}

final class PlaceDetailRoute extends AppRoute {
  const PlaceDetailRoute(this.model);
  final ItemPlaceModel model;
}

final class GalleryDetailRoute extends AppRoute {
  const GalleryDetailRoute(this.model);
  final ItemGalleryModel model;
}
