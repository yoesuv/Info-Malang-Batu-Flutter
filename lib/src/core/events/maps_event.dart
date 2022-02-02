import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MapsEvent extends Equatable {}

class MapsEventInit extends MapsEvent {
  final BuildContext context;

  MapsEventInit({required this.context});

  @override
  List<Object?> get props => [context];
}

class MapsEventRequestPermissionLocation extends MapsEvent {
  @override
  List<Object?> get props => [];
}
