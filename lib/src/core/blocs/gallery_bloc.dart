import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/gallery_event.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_gallery_repository.dart';
import 'package:info_malang_batu_flutter/src/core/states/gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final ListGalleryRepository _listGalleryRepository = ListGalleryRepository();

  GalleryBloc() : super(const GalleryState()) {
    on<GalleryEventInit>(_initGallery);
  }

  void _initGallery(GalleryEventInit event, Emitter<GalleryState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _listGalleryRepository.getListGallery();
      emit(state.copyWith(isLoading: false, listItemGalleryModel: response));
    } catch (e) {
      debugPrint('GalleryBloc # error $e');
    }
  }
}
