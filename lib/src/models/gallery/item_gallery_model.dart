class ItemGalleryModel {

    final String caption;
    final String thumbnail;
    final String image;

    ItemGalleryModel.fromJson(Map<String, dynamic> parsedJson):
        caption = parsedJson['caption'],
        thumbnail = parsedJson['thumbnail'],
        image = parsedJson['image'];

}
