import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/item_maps_pin_model.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsState extends Equatable {
  final bool? locationService;
  final PermissionStatus? permissionStatus;
  final List<ItemMapsPinModel>? listPin;

  const MapsState({this.locationService, this.permissionStatus, this.listPin});

  MapsState copyWith({
    bool? locationService,
    PermissionStatus? permissionStatus,
    List<ItemMapsPinModel>? listPin,
  }) {
    return MapsState(
      locationService: locationService ?? this.locationService,
      permissionStatus: permissionStatus ?? this.permissionStatus,
      listPin: listPin ?? this.listPin,
    );
  }

  @override
  List<Object?> get props => [locationService, permissionStatus, listPin];
}
