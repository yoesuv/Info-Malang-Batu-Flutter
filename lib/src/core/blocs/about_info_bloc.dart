import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_info_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_info_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutInfoBloc extends Bloc<AboutInfoEvent, AboutInfoState> {
  AboutInfoBloc() : super(const AboutInfoState()) {
    on<AboutInfoEventInit>(_initAboutInfo);
  }

  void _initAboutInfo(
    AboutInfoEventInit event,
    Emitter<AboutInfoState> emit,
  ) async {
    final packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(version: packageInfo.version));
  }
}
