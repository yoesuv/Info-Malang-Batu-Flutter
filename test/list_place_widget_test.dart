import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/list_place_bloc_mock.dart';
import 'response/list_place_all.dart';

void main() {
  late ListPlaceBlocMock listPlaceBlocMock;

  setUp(() {
    listPlaceBlocMock = ListPlaceBlocMock();

    when(() => listPlaceBlocMock.state).thenReturn(
      const ListPlaceState(
        status: FormzSubmissionStatus.initial,
        listPlaceType: ListPlaceType.ALL,
      ),
    );
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
    testWidgets('should show loading indicator when in progress', (
      tester,
    ) async {
      final loadingState = ListPlaceState(
        status: FormzSubmissionStatus.inProgress,
        listPlaceType: ListPlaceType.ALL,
      );
      // Set up stream behavior
      when(
        () => listPlaceBlocMock.stream,
      ).thenAnswer((_) => Stream.fromIterable([loadingState]));

      when(() => listPlaceBlocMock.state).thenReturn(loadingState);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show list when success', (tester) async {
      final successState = ListPlaceState(
        status: FormzSubmissionStatus.success,
        listPlaceType: ListPlaceType.ALL,
        listPlace: responseSuccessListPlaceAll,
      );
      // Set up stream behavior
      when(
        () => listPlaceBlocMock.stream,
      ).thenAnswer((_) => Stream.fromIterable([successState]));

      when(() => listPlaceBlocMock.state).thenReturn(successState);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text("Alun Alun Malang"), findsOneWidget);
      expect(find.text("Alun Alun Batu"), findsOneWidget);
    });
  });
}
