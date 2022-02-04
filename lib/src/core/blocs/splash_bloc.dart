import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/splash_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/splash_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashEventInit>(_initSplash);
  }

  Future<void> _initSplash(SplashEventInit event, Emitter<SplashState> emit) async {
    final packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(version: packageInfo.version));
  }
}