import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_changelog_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_changelog_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_changelog_state.dart';

void main() {
  late AboutChangelogBloc aboutChangelogBloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    aboutChangelogBloc = AboutChangelogBloc();
  });

  tearDown(() {
    aboutChangelogBloc.close();
  });

  test("AboutChangelogBloc initial state is empty", () {
    expect(aboutChangelogBloc.state.listChangelog, isNull);
  });

  blocTest<AboutChangelogBloc, AboutChangelogState>(
    'emits [loaded] when AboutChangelogEventInit is added',
    build: () => aboutChangelogBloc,
    act: (bloc) => bloc.add(AboutChangelogEventInit()),
    expect: () => [
      isA<AboutChangelogState>().having(
        (state) => state.listChangelog,
        'listChangelog',
        isNotNull,
      ),
    ],
  );

  blocTest<AboutChangelogBloc, AboutChangelogState>(
    'emits state with 16 changelog items when AboutChangelogEventInit is added',
    build: () => aboutChangelogBloc,
    act: (bloc) => bloc.add(AboutChangelogEventInit()),
    expect: () => [
      isA<AboutChangelogState>().having(
        (state) => state.listChangelog?.length,
        'listChangelog length',
        16,
      ),
    ],
  );

  blocTest<AboutChangelogBloc, AboutChangelogState>(
    'emits state with correct version names',
    build: () => aboutChangelogBloc,
    act: (bloc) => bloc.add(AboutChangelogEventInit()),
    expect: () => [
      isA<AboutChangelogState>().having(
        (state) => state.listChangelog?.map((item) => item.version).toList(),
        'version names',
        containsAll([
          'Versi 2.0.8',
          'Versi 2.0.7',
          'Versi 2.0.6',
          'Versi 2.0.5',
          'Versi 2.0.4',
          'Versi 2.0.3',
          'Versi 2.0.2',
          'Versi 2.0.1',
          'Versi 2.0.0',
          'Versi 1.1.0',
          'Versi 1.0.5',
          'Versi 1.0.4',
          'Versi 1.0.3',
          'Versi 1.0.2',
          'Versi 1.0.1',
          'Versi 1.0.0',
        ]),
      ),
    ],
  );

  blocTest<AboutChangelogBloc, AboutChangelogState>(
    'emits state with correct changelog content',
    build: () => aboutChangelogBloc,
    act: (bloc) => bloc.add(AboutChangelogEventInit()),
    expect: () => [
      isA<AboutChangelogState>().having(
        (state) => state.listChangelog?.first.changelog,
        'first changelog',
        '• update libraries',
      ),
    ],
  );
}