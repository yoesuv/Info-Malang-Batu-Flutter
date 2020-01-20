class ItemMapsPinModel {

    ItemMapsPinModel.fromJson(Map<String, dynamic> parsedJson):
    name = parsedJson['name'].toString(),
    lokasi = parsedJson['lokasi'] as int,
    latitude = parsedJson['latitude'] as double,
    longitude = parsedJson['longitude'] as double;

    final String name;
    final int lokasi;
    final double latitude;
    final double longitude;


}
