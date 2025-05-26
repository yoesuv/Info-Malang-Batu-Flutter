import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/events/gallery_event.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_gallery_repository.dart';
import 'package:info_malang_batu_flutter/src/core/states/gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final ListGalleryRepository _listGalleryRepository;

  GalleryBloc(this._listGalleryRepository) : super(const GalleryState()) {
    on<GalleryEventInit>(_initGallery);
  }

  void _initGallery(GalleryEventInit event, Emitter<GalleryState> emit) async {
    final list = state.listGallery ?? [];
    if (list.isEmpty) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final response = await _listGalleryRepository.getListGallery();
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.success,
            listGallery: response.listItemGalleryModel,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            listGallery: [],
          ),
        );
      }
    }
  }
}
