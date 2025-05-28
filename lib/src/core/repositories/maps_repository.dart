import 'package:info_malang_batu_flutter/src/core/models/maps/list_item_maps_pin_model.dart';

abstract class MapsRepository {
  Future<ListItemMapsPinModel> getMapsPin();
}
