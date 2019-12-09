class ItemMapsPin {

    final String name;
    final String lokasi;
    final String latitude;
    final String longitude;

    ItemMapsPin.fromJson(Map<String, dynamic> parsedJson):
        name = parsedJson['name'],
        lokasi = parsedJson['lokasi'],
        latitude = parsedJson['latitude'],
        longitude = parsedJson['longitude'];

}
