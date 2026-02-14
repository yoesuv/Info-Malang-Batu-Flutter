import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final String? version;

  const SplashState({this.version});

  SplashState copyWith({String? version}) {
    return SplashState(version: version ?? this.version);
  }

  @override
  List<Object?> get props => [version];
}
