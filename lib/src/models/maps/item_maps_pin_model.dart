class ItemMapsPinModel {

    final String name;
    final int lokasi;
    final double latitude;
    final double longitude;

    ItemMapsPinModel.fromJson(Map<String, dynamic> parsedJson):
        name = parsedJson['name'],
        lokasi = parsedJson['lokasi'],
        latitude = parsedJson['latitude'],
        longitude = parsedJson['longitude'];

}
