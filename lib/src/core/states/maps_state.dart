import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsState extends Equatable {
  final bool? locationService;
  final List<Marker>? listMarker;
  final PermissionStatus? permissionStatus;

  const MapsState({
    this.locationService,
    this.listMarker,
    this.permissionStatus,
  });

  MapsState copyWith({
    bool? locationService,
    List<Marker>? listMarker,
    PermissionStatus? permissionStatus,
  }) {
    return MapsState(
      locationService: locationService ?? this.locationService,
      listMarker: listMarker ?? this.listMarker,
      permissionStatus: permissionStatus ?? this.permissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        locationService,
        listMarker,
        permissionStatus,
      ];
}
