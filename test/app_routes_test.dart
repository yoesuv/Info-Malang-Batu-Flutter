import 'package:flutter_test/flutter_test.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/routes/app_routes.dart';

void main() {
  group('AppRoute', () {
    group('PlaceDetailRoute', () {
      test('should be an AppRoute', () {
        const model = ItemPlaceModel(
          nama: 'Test Place',
          lokasi: 'Test Location',
          deskripsi: 'Test Description',
          thumbnail: 'thumb.jpg',
          gambar: 'image.jpg',
        );
        const route = PlaceDetailRoute(model);
        expect(route, isA<AppRoute>());
      });

      test('should hold the correct model', () {
        const model = ItemPlaceModel(
          nama: 'Test Place',
          lokasi: 'Test Location',
          deskripsi: 'Test Description',
          thumbnail: 'thumb.jpg',
          gambar: 'image.jpg',
        );
        const route = PlaceDetailRoute(model);
        expect(route.model, equals(model));
      });

      test('equality with same model', () {
        const model = ItemPlaceModel(
          nama: 'Test Place',
          lokasi: 'Test Location',
          deskripsi: 'Test Description',
          thumbnail: 'thumb.jpg',
          gambar: 'image.jpg',
        );
        const route1 = PlaceDetailRoute(model);
        const route2 = PlaceDetailRoute(model);
        expect(route1, equals(route2));
      });

      test('inequality with different model', () {
        const route1 = PlaceDetailRoute(
          ItemPlaceModel(
            nama: 'Place A',
            lokasi: 'Location A',
            deskripsi: 'Description A',
            thumbnail: 'thumb_a.jpg',
            gambar: 'image_a.jpg',
          ),
        );
        const route2 = PlaceDetailRoute(
          ItemPlaceModel(
            nama: 'Place B',
            lokasi: 'Location B',
            deskripsi: 'Description B',
            thumbnail: 'thumb_b.jpg',
            gambar: 'image_b.jpg',
          ),
        );
        expect(route1, isNot(equals(route2)));
      });

      test('model properties are accessible', () {
        const model = ItemPlaceModel(
          nama: 'Test Place',
          lokasi: 'Test Location',
          deskripsi: 'Test Description',
          thumbnail: 'thumb.jpg',
          gambar: 'image.jpg',
        );
        const route = PlaceDetailRoute(model);
        expect(route.model.nama, 'Test Place');
        expect(route.model.lokasi, 'Test Location');
        expect(route.model.deskripsi, 'Test Description');
      });
    });

    group('GalleryDetailRoute', () {
      test('should be an AppRoute', () {
        const model = ItemGalleryModel(
          caption: 'Test Caption',
          thumbnail: 'thumb.jpg',
          image: 'image.jpg',
        );
        const route = GalleryDetailRoute(model);
        expect(route, isA<AppRoute>());
      });

      test('should hold the correct model', () {
        const model = ItemGalleryModel(
          caption: 'Test Caption',
          thumbnail: 'thumb.jpg',
          image: 'image.jpg',
        );
        const route = GalleryDetailRoute(model);
        expect(route.model, equals(model));
      });

      test('equality with same model', () {
        const model = ItemGalleryModel(
          caption: 'Test Caption',
          thumbnail: 'thumb.jpg',
          image: 'image.jpg',
        );
        const route1 = GalleryDetailRoute(model);
        const route2 = GalleryDetailRoute(model);
        expect(route1, equals(route2));
      });

      test('inequality with different model', () {
        const route1 = GalleryDetailRoute(
          ItemGalleryModel(
            caption: 'Caption A',
            thumbnail: 'thumb_a.jpg',
            image: 'image_a.jpg',
          ),
        );
        const route2 = GalleryDetailRoute(
          ItemGalleryModel(
            caption: 'Caption B',
            thumbnail: 'thumb_b.jpg',
            image: 'image_b.jpg',
          ),
        );
        expect(route1, isNot(equals(route2)));
      });

      test('model properties are accessible', () {
        const model = ItemGalleryModel(
          caption: 'Test Caption',
          thumbnail: 'thumb.jpg',
          image: 'image.jpg',
        );
        const route = GalleryDetailRoute(model);
        expect(route.model.caption, 'Test Caption');
        expect(route.model.thumbnail, 'thumb.jpg');
        expect(route.model.image, 'image.jpg');
      });
    });

    test('pattern matching on sealed AppRoute covers all subtypes', () {
      const placeRoute = PlaceDetailRoute(
        ItemPlaceModel(
          nama: 'Place',
          lokasi: 'Loc',
          deskripsi: 'Desc',
          thumbnail: 'thumb',
          gambar: 'gambar',
        ),
      );
      const galleryRoute = GalleryDetailRoute(
        ItemGalleryModel(
          caption: 'Caption',
          thumbnail: 'thumb',
          image: 'image',
        ),
      );

      final result1 = switch (placeRoute) {
        PlaceDetailRoute() => 'place',
        GalleryDetailRoute() => 'gallery',
      };
      expect(result1, 'place');

      final result2 = switch (galleryRoute) {
        PlaceDetailRoute() => 'place',
        GalleryDetailRoute() => 'gallery',
      };
      expect(result2, 'gallery');
    });

    test('AppRoute list can contain mixed subtypes', () {
      const routes = <AppRoute>[
        PlaceDetailRoute(
          ItemPlaceModel(
            nama: 'P1',
            lokasi: 'L1',
            deskripsi: 'D1',
            thumbnail: 't1',
            gambar: 'g1',
          ),
        ),
        GalleryDetailRoute(
          ItemGalleryModel(caption: 'C1', thumbnail: 't1', image: 'i1'),
        ),
        PlaceDetailRoute(
          ItemPlaceModel(
            nama: 'P2',
            lokasi: 'L2',
            deskripsi: 'D2',
            thumbnail: 't2',
            gambar: 'g2',
          ),
        ),
      ];

      expect(routes.length, 3);
      expect(routes.whereType<PlaceDetailRoute>().length, 2);
      expect(routes.whereType<GalleryDetailRoute>().length, 1);
    });
  });
}
