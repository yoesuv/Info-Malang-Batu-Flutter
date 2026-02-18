import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';

class GalleryState extends Equatable {
  final FormzSubmissionStatus status;
  final List<ItemGalleryModel>? listGallery;

  const GalleryState({
    this.status = FormzSubmissionStatus.initial,
    this.listGallery,
  });

  GalleryState copyWith({
    FormzSubmissionStatus? status,
    List<ItemGalleryModel>? listGallery,
  }) {
    return GalleryState(
      status: status ?? this.status,
      listGallery: listGallery ?? this.listGallery,
    );
  }

  @override
  List<Object?> get props => [status, listGallery];
}
