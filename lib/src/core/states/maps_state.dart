import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState extends Equatable {
  final bool locationService;
  final List<Marker>? listMarker;
  final bool? isPermissionLocationEnabled;

  const MapsState({
    this.locationService = true,
    this.listMarker,
    this.isPermissionLocationEnabled,
  });

  MapsState copyWith({
    bool? locationService,
    List<Marker>? listMarker,
    bool? isPermissionLocationEnabled,
  }) {
    return MapsState(
      locationService: locationService ?? this.locationService,
      listMarker: listMarker ?? this.listMarker,
      isPermissionLocationEnabled:
          isPermissionLocationEnabled ?? this.isPermissionLocationEnabled,
    );
  }

  @override
  List<Object?> get props => [
        locationService,
        listMarker,
        isPermissionLocationEnabled,
      ];
}
