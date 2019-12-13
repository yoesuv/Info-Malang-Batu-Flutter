class ItemPlaceModel {

    final String nama;
    final String lokasi;
    final String deskripsi;
    final String thumbnail;
    final String gambar;

    ItemPlaceModel.fromJson(Map<String, dynamic> parsedJson):
        nama = parsedJson['nama'],
        lokasi = parsedJson['lokasi'],
        deskripsi = parsedJson['deskripsi'],
        thumbnail = parsedJson['thumbnail'],
        gambar = parsedJson['gambar'];

}
