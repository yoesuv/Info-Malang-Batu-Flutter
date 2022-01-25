import 'package:equatable/equatable.dart';

class AboutInfoState extends Equatable {
  final String? version;

  const AboutInfoState({this.version});

  AboutInfoState copyWith({String? version}) {
    return AboutInfoState(
      version: version ?? this.version,
    );
  }

  @override
  List<Object?> get props => [];
}
