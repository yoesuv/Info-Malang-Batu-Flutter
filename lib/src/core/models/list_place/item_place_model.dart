class ItemPlaceModel {

    ItemPlaceModel.fromJson(Map<String, dynamic> parsedJson):
    nama = parsedJson['nama'].toString(),
    lokasi = parsedJson['lokasi'].toString(),
    deskripsi = parsedJson['deskripsi'].toString(),
    thumbnail = parsedJson['thumbnail'].toString(),
    gambar = parsedJson['gambar'].toString();

    final String nama;
    final String lokasi;
    final String deskripsi;
    final String thumbnail;
    final String gambar;

}