import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/list_place_bloc_mock.dart';

void main() {
  late ListPlaceBlocMock listPlaceBlocMock;

  setUpAll(() {
    registerFallbackValue(ListPlaceEventInit(ListPlaceType.ALL));
    registerFallbackValue(ListPlaceEventLocationChanged(ListPlaceType.ALL));
  });

  setUp(() {
    listPlaceBlocMock = ListPlaceBlocMock();

    when(() => listPlaceBlocMock.state).thenReturn(
      const ListPlaceState(
        status: FormzSubmissionStatus.initial,
        listPlaceType: ListPlaceType.ALL,
      ),
    );

    // Set up stream behavior
    when(() => listPlaceBlocMock.stream).thenAnswer(
          (_) => Stream.fromIterable([
        const ListPlaceState(
          status: FormzSubmissionStatus.inProgress,
          listPlaceType: ListPlaceType.ALL,
        ),
      ]),
    );

    when(() => listPlaceBlocMock.add(any())).thenReturn(null);
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ListPlaceBloc>.value(
        value: listPlaceBlocMock,
        child: const ListPlace(),
      ),
    );
  }

  group('ListPlace Widget Tests', () {
    testWidgets(
      'should show loading indicator when in progress',
          (tester) async {
        when(() => listPlaceBlocMock.state).thenReturn(
          const ListPlaceState(
            status: FormzSubmissionStatus.inProgress,
            listPlaceType: ListPlaceType.ALL,
          ),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );
  });
}