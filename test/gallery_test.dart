import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/gallery_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';

import 'mock/list_gallery_repository_mock.dart';
import 'utils/json_helper.dart';

void main() {
  late GalleryBloc galleryBloc;
  late ListGalleryRepositoryMock listGalleryRepositoryMock;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    listGalleryRepositoryMock = ListGalleryRepositoryMock();
    galleryBloc = GalleryBloc(listGalleryRepositoryMock);
  });

  tearDown(() {
    galleryBloc.close();
  });

  test("JSON valid data all", () async {
    var strJson = await loadJsonFromAsset('test/json/list_place_all.json');
    final List<dynamic> jsonList = jsonDecode(strJson);
    var gallery = ListItemGalleryModel.fromJson(jsonList);
    expect(gallery.listItemGalleryModel.length, 3);
  });

}
