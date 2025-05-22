import 'package:equatable/equatable.dart';

class ItemGalleryModel extends Equatable {
  ItemGalleryModel.fromJson(Map<String, dynamic> parsedJson)
    : caption = parsedJson['caption'].toString(),
      thumbnail = parsedJson['thumbnail'].toString(),
      image = parsedJson['image'].toString();

  final String caption;
  final String thumbnail;
  final String image;

  const ItemGalleryModel({
    required this.caption,
    required this.thumbnail,
    required this.image,
  });

  @override
  List<Object?> get props => [caption, thumbnail, image];
}
