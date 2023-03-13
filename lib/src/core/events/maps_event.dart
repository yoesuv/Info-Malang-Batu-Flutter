import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MapsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MapsEventInit extends MapsEvent {
  final BuildContext context;
  MapsEventInit({required this.context});
  @override
  List<Object?> get props => [context];
}

class MapsEventPermissionLocation extends MapsEvent {}

class MapsCheckServiceLocation extends MapsEvent {}