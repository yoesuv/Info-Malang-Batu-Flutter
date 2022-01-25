import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState extends Equatable {
  final bool? isLocationServiceEnabled;
  final List<Marker>? listMarker;

  const MapsState({this.isLocationServiceEnabled, this.listMarker});

  MapsState copyWith({bool? isLocationServiceEnabled, List<Marker>? listMarker}) {
    return MapsState(
      isLocationServiceEnabled: isLocationServiceEnabled ?? this.isLocationServiceEnabled,
      listMarker: listMarker ?? this.listMarker,
    );
  }

  @override
  List<Object?> get props => [isLocationServiceEnabled, listMarker];
}
