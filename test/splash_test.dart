import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/splash_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/splash_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/splash_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  late SplashBloc splashBloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    PackageInfo.setMockInitialValues(
      appName: 'Info Malang Batu',
      packageName: 'com.yoesuv.info_malang_batu',
      version: '2.0.8',
      buildNumber: '1',
      buildSignature: '',
    );
    splashBloc = SplashBloc();
  });

  tearDown(() {
    splashBloc.close();
  });

  test('SplashBloc initial state has null version', () {
    expect(splashBloc.state.version, isNull);
  });

  blocTest<SplashBloc, SplashState>(
    'emits state with non-null version when SplashInitEvent is added',
    build: () => splashBloc,
    act: (bloc) => bloc.add(SplashInitEvent()),
    expect: () => [
      isA<SplashState>().having((state) => state.version, 'version', isNotNull),
    ],
  );

  blocTest<SplashBloc, SplashState>(
    'emits state with correct version when SplashInitEvent is added',
    build: () => splashBloc,
    act: (bloc) => bloc.add(SplashInitEvent()),
    expect: () => [
      isA<SplashState>().having((state) => state.version, 'version', '2.0.8'),
    ],
  );
}
