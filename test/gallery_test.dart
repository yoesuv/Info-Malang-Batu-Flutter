import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/gallery_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/gallery_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/gallery_state.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/list_gallery_repository_mock.dart';
import 'response/list_gallery_response.dart';
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

  test("JSON valid data gallery", () async {
    var strJson = await loadJsonFromAsset('test/json/gallery.json');
    final List<dynamic> jsonList = jsonDecode(strJson);
    var gallery = ListItemGalleryModel.fromJson(jsonList);
    expect(gallery.listItemGalleryModel.length, 3);
  });

  blocTest<GalleryBloc, GalleryState>(
    'emits [loading, loaded] when GalleryEventInit is added and data is fetched successfully',
    build: () => galleryBloc,
    act: (bloc) => bloc.add(GalleryEventInit()),
    expect:
        () => [
          GalleryState(status: FormzSubmissionStatus.inProgress),
          GalleryState(
            status: FormzSubmissionStatus.success,
            listGallery: responseSuccessListGallery,
          ),
        ],
  );
}
