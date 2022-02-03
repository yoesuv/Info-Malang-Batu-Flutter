import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState extends Equatable {
  final List<Marker>? listMarker;

  const MapsState({this.listMarker});

  MapsState copyWith({List<Marker>? listMarker}) {
    return MapsState(
      listMarker: listMarker ?? this.listMarker,
    );
  }

  @override
  List<Object?> get props => [listMarker];
}
