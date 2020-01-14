class ItemGalleryModel {

    ItemGalleryModel.fromJson(Map<String, dynamic> parsedJson):
    caption = parsedJson['caption'].toString(),
    thumbnail = parsedJson['thumbnail'].toString(),
    image = parsedJson['image'].toString();

    final String caption;
    final String thumbnail;
    final String image;

}
