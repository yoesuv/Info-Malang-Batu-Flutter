import 'dart:async';
import 'dart:convert';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_gallery_repository.dart';
import 'package:mocktail/mocktail.dart';
import '../utils/json_helper.dart';

class ListGalleryRepositoryMock extends Mock implements ListGalleryRepository {
  @override
  Future<ListItemGalleryModel> getListGallery() async {
    final response = await loadJsonFromAsset('test/json/gallery.json');
    final List<dynamic> jsonList = jsonDecode(response);
    return ListItemGalleryModel.fromJson(jsonList);
  }
}
