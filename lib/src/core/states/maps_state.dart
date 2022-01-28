import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState extends Equatable {
  final bool? isLocationServiceEnabled;
  final bool? isLocationPermissionGranted;
  final List<Marker>? listMarker;

  const MapsState({this.isLocationServiceEnabled, this.isLocationPermissionGranted, this.listMarker});

  MapsState copyWith({bool? isLocationServiceEnabled, bool? isLocationPermissionGranted, List<Marker>? listMarker}) {
    return MapsState(
      isLocationServiceEnabled: isLocationServiceEnabled ?? this.isLocationServiceEnabled,
      isLocationPermissionGranted: isLocationPermissionGranted ?? this.isLocationPermissionGranted,
      listMarker: listMarker ?? this.listMarker,
    );
  }

  @override
  List<Object?> get props => [isLocationServiceEnabled, isLocationPermissionGranted, listMarker];
}
