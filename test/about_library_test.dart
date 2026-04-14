import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_library_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_library_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_library_state.dart';
import 'package:info_malang_batu_flutter/src/data/libraries.dart';

void main() {
  late AboutLibraryBloc aboutLibraryBloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    aboutLibraryBloc = AboutLibraryBloc();
  });

  tearDown(() {
    aboutLibraryBloc.close();
  });

  test("AboutLibraryBloc initial state is empty", () {
    expect(aboutLibraryBloc.state.listItemLibrary, isNull);
  });

  blocTest<AboutLibraryBloc, AboutLibraryState>(
    'emits [loaded] when AboutLibraryEventInit is added',
    build: () => aboutLibraryBloc,
    act: (bloc) => bloc.add(AboutLibraryEventInit()),
    expect: () => [
      isA<AboutLibraryState>().having(
        (state) => state.listItemLibrary,
        'listItemLibrary',
        isNotNull,
      ),
    ],
  );

  blocTest<AboutLibraryBloc, AboutLibraryState>(
    'emits state with 8 library items when AboutLibraryEventInit is added',
    build: () => aboutLibraryBloc,
    act: (bloc) => bloc.add(AboutLibraryEventInit()),
    expect: () => [
      isA<AboutLibraryState>().having(
        (state) => state.listItemLibrary?.length,
        'listItemLibrary length',
        8,
      ),
    ],
  );

  blocTest<AboutLibraryBloc, AboutLibraryState>(
    'emits state with correct library names',
    build: () => aboutLibraryBloc,
    act: (bloc) => bloc.add(AboutLibraryEventInit()),
    expect: () => [
      isA<AboutLibraryState>().having(
        (state) => state.listItemLibrary?.map((item) => item.name).toList(),
        'library names',
        containsAll([
          flutter,
          blocLibrary,
          cachedNetworkImage,
          dio,
          equatable,
          googleMapsFlutter,
          packageInfoPlus,
          permissionHandler,
        ]),
      ),
    ],
  );

  blocTest<AboutLibraryBloc, AboutLibraryState>(
    'emits state with correct library URLs',
    build: () => aboutLibraryBloc,
    act: (bloc) => bloc.add(AboutLibraryEventInit()),
    expect: () => [
      isA<AboutLibraryState>().having(
        (state) => state.listItemLibrary?.map((item) => item.url).toList(),
        'library URLs',
        containsAll([
          flutterUrl,
          blocLibraryUrl,
          cachedNetworkImageUrl,
          dioUrl,
          equatableUrl,
          googleMapsFlutterUrl,
          packageInfoPlusUrl,
          permissionHandlerUrl,
        ]),
      ),
    ],
  );
}
