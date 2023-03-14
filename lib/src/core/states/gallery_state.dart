import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';

class GalleryState extends Equatable {
  final FormzSubmissionStatus status;
  final ListItemGalleryModel? listItemGalleryModel;

  const GalleryState({
    this.status = FormzSubmissionStatus.initial,
    this.listItemGalleryModel,
  });

  GalleryState copyWith({
    FormzSubmissionStatus? status,
    ListItemGalleryModel? listItemGalleryModel,
  }) {
    return GalleryState(
      status: status ?? this.status,
      listItemGalleryModel: listItemGalleryModel ?? this.listItemGalleryModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listItemGalleryModel,
      ];
}
