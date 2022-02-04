import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState extends Equatable {
  final List<Marker>? listMarker;
  final bool? isPermissionLocationEnabled;

  const MapsState({this.listMarker, this.isPermissionLocationEnabled});

  MapsState copyWith({List<Marker>? listMarker, bool? isPermissionLocationEnabled}) {
    return MapsState(
      listMarker: listMarker ?? this.listMarker,
      isPermissionLocationEnabled: isPermissionLocationEnabled ?? this.isPermissionLocationEnabled,
    );
  }

  @override
  List<Object?> get props => [listMarker, isPermissionLocationEnabled];
}
