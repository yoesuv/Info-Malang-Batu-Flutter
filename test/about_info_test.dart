import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_info_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_info_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_info_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  late AboutInfoBloc aboutInfoBloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    PackageInfo.setMockInitialValues(
      appName: 'Info Malang Batu',
      packageName: 'com.yoesuv.info_malang_batu',
      version: '2.0.8',
      buildNumber: '1',
      buildSignature: '',
    );
    aboutInfoBloc = AboutInfoBloc();
  });

  tearDown(() {
    aboutInfoBloc.close();
  });

  test("AboutInfoBloc initial state has null version", () {
    expect(aboutInfoBloc.state.version, isNull);
  });

  blocTest<AboutInfoBloc, AboutInfoState>(
    'emits [loaded] when AboutInfoEventInit is added',
    build: () => aboutInfoBloc,
    act: (bloc) => bloc.add(AboutInfoEventInit()),
    expect: () => [
      isA<AboutInfoState>().having(
        (state) => state.version,
        'version',
        isNotNull,
      ),
    ],
  );

  blocTest<AboutInfoBloc, AboutInfoState>(
    'emits state with correct version when AboutInfoEventInit is added',
    build: () => aboutInfoBloc,
    act: (bloc) => bloc.add(AboutInfoEventInit()),
    expect: () => [
      isA<AboutInfoState>().having(
        (state) => state.version,
        'version',
        '2.0.8',
      ),
    ],
  );
}