import 'package:equatable/equatable.dart';

class ItemPlaceModel extends Equatable {
  ItemPlaceModel.fromJson(Map<String, dynamic> parsedJson)
    : nama = parsedJson['nama'].toString(),
      lokasi = parsedJson['lokasi'].toString(),
      deskripsi = parsedJson['deskripsi'].toString(),
      thumbnail = parsedJson['thumbnail'].toString(),
      gambar = parsedJson['gambar'].toString();

  final String nama;
  final String lokasi;
  final String deskripsi;
  final String thumbnail;
  final String gambar;

  const ItemPlaceModel({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.thumbnail,
    required this.gambar,
  });

  @override
  List<Object?> get props => [nama, lokasi, deskripsi, thumbnail, gambar];
}
