import 'package:equatable/equatable.dart';

class ItemMapsPinModel extends Equatable {
  ItemMapsPinModel.fromJson(Map<String, dynamic> parsedJson)
    : name = parsedJson['name'].toString(),
      lokasi = parsedJson['lokasi'] as int,
      latitude = parsedJson['latitude'] as double,
      longitude = parsedJson['longitude'] as double;

  final String name;
  final int lokasi;
  final double latitude;
  final double longitude;

  const ItemMapsPinModel({
    required this.name,
    required this.lokasi,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, lokasi, latitude, longitude];
}
