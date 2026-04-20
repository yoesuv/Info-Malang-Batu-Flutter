import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery_detail.dart';

void main() {
  group('GalleryDetail Widget Tests', () {
    testWidgets('should display AppBar with correct title', (tester) async {
      const itemGalleryModel = ItemGalleryModel(
        caption: 'Test Caption',
        thumbnail: 'https://example.com/thumbnail.jpg',
        image: 'https://example.com/image.jpg',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: GalleryDetail(itemGalleryModel: itemGalleryModel),
        ),
      );

      expect(find.text('Detail Galeri'), findsOneWidget);
    });

    testWidgets('should display caption text when model has caption', (
      tester,
    ) async {
      const itemGalleryModel = ItemGalleryModel(
        caption: 'Test Caption',
        thumbnail: 'https://example.com/thumbnail.jpg',
        image: 'https://example.com/image.jpg',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: GalleryDetail(itemGalleryModel: itemGalleryModel),
        ),
      );

      expect(find.text('Test Caption'), findsOneWidget);
    });

    testWidgets('should display empty caption when model has empty caption', (
      tester,
    ) async {
      const itemGalleryModel = ItemGalleryModel(
        caption: '',
        thumbnail: 'https://example.com/thumbnail.jpg',
        image: 'https://example.com/image.jpg',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: GalleryDetail(itemGalleryModel: itemGalleryModel),
        ),
      );

      // Empty caption should still render a Text widget with empty string
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('should display empty caption when model is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: GalleryDetail(itemGalleryModel: null)),
      );

      // Should still render without errors
      expect(find.byType(GalleryDetail), findsOneWidget);
      expect(find.text('Detail Galeri'), findsOneWidget);
    });

    testWidgets('should display image widget', (tester) async {
      const itemGalleryModel = ItemGalleryModel(
        caption: 'Test Caption',
        thumbnail: 'https://example.com/thumbnail.jpg',
        image: 'https://example.com/image.jpg',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: GalleryDetail(itemGalleryModel: itemGalleryModel),
        ),
      );

      // Should contain CachedNetworkImage or Image widget
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('should display placeholder when image is loading', (
      tester,
    ) async {
      const itemGalleryModel = ItemGalleryModel(
        caption: 'Test Caption',
        thumbnail: 'https://example.com/thumbnail.jpg',
        image: 'https://example.com/image.jpg',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: GalleryDetail(itemGalleryModel: itemGalleryModel),
        ),
      );

      // Pump the widget to trigger image loading
      await tester.pump();

      // Should contain Image widget (placeholder or network image)
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('should have correct layout structure', (tester) async {
      const itemGalleryModel = ItemGalleryModel(
        caption: 'Test Caption',
        thumbnail: 'https://example.com/thumbnail.jpg',
        image: 'https://example.com/image.jpg',
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: GalleryDetail(itemGalleryModel: itemGalleryModel),
        ),
      );

      // Should have Scaffold as root
      expect(find.byType(Scaffold), findsOneWidget);

      // Should have AppBar
      expect(find.byType(AppBar), findsOneWidget);

      // Should have Column layout
      expect(find.byType(Column), findsOneWidget);
    });
  });
}
