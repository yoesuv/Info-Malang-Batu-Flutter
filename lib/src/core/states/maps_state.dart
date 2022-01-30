import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState extends Equatable {
  final bool? isChecking;
  final bool? isLocationServiceEnabled;
  final bool? isLocationPermissionGranted;
  final List<Marker>? listMarker;

  const MapsState({this.isChecking, this.isLocationServiceEnabled, this.isLocationPermissionGranted, this.listMarker});

  MapsState copyWith({bool? isChecking, bool? isLocationServiceEnabled, bool? isLocationPermissionGranted, List<Marker>? listMarker}) {
    return MapsState(
      isChecking: isChecking ?? this.isChecking,
      isLocationServiceEnabled: isLocationServiceEnabled ?? this.isLocationServiceEnabled,
      isLocationPermissionGranted: isLocationPermissionGranted ?? this.isLocationPermissionGranted,
      listMarker: listMarker ?? this.listMarker,
    );
  }

  @override
  List<Object?> get props => [isChecking, isLocationServiceEnabled, isLocationPermissionGranted, listMarker];
}
