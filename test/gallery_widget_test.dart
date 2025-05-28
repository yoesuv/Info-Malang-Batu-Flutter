import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/gallery_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/states/gallery_state.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_gallery.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/gallery_bloc_mock.dart';
import 'response/list_gallery.dart';

void main() {
  late GalleryBlocMock galleryBlocMock;

  setUp(() {
    galleryBlocMock = GalleryBlocMock();

    when(
      () => galleryBlocMock.state,
    ).thenReturn(const GalleryState(status: FormzSubmissionStatus.initial));
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<GalleryBloc>.value(
        value: galleryBlocMock,
        child: const Gallery(),
      ),
    );
  }

  group('Gallery Widget Tests', () {
    testWidgets('should show loading indicator when in progress', (
      tester,
    ) async {
      final loadingState = const GalleryState(
        status: FormzSubmissionStatus.inProgress,
      );

      when(
        () => galleryBlocMock.stream,
      ).thenAnswer((_) => Stream.fromIterable([loadingState]));

      when(() => galleryBlocMock.state).thenReturn(loadingState);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show gallery items when success', (tester) async {
      final successState = GalleryState(
        status: FormzSubmissionStatus.success,
        listGallery: responseSuccessListGallery,
      );

      when(
        () => galleryBlocMock.stream,
      ).thenAnswer((_) => Stream.fromIterable([successState]));

      when(() => galleryBlocMock.state).thenReturn(successState);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Verify gallery items are displayed
      // 3 items in the mock data
      expect(find.byType(ItemGallery), findsNWidgets(3));
    });
  });
}
