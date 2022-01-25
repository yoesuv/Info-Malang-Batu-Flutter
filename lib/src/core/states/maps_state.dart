import 'package:equatable/equatable.dart';

class MapsState extends Equatable {
  final bool? isLocationServiceEnabled;

  const MapsState({this.isLocationServiceEnabled});

  MapsState copyWith({bool? isLocationServiceEnabled}) {
    return MapsState(
      isLocationServiceEnabled: isLocationServiceEnabled ?? this.isLocationServiceEnabled,
    );
  }

  @override
  List<Object?> get props => [isLocationServiceEnabled];
}
