import 'package:equatable/equatable.dart';

abstract class MapsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MapsEventInit extends MapsEvent {}

class MapsEventPermissionLocation extends MapsEvent {}

class MapsCheckServiceLocation extends MapsEvent {}