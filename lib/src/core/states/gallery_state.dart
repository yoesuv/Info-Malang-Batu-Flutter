import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';

class GalleryState extends Equatable {
  final bool? isLoading;
  final ListItemGalleryModel? listItemGalleryModel;

  const GalleryState({this.isLoading, this.listItemGalleryModel});

  GalleryState copyWith({bool? isLoading, ListItemGalleryModel? listItemGalleryModel}) {
    return GalleryState(
      isLoading: isLoading ?? this.isLoading,
      listItemGalleryModel: listItemGalleryModel ?? this.listItemGalleryModel,
    );
  }

  @override
  List<Object?> get props => [isLoading, listItemGalleryModel];
}
