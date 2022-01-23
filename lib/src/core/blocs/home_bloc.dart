import 'package:info_malang_batu_flutter/src/core/services/app_exceptions.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';
import 'package:rxdart/rxdart.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_place_repository.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/list_gallery_repository.dart';
import 'package:info_malang_batu_flutter/src/core/repositories/maps_repository.dart';
import 'package:info_malang_batu_flutter/src/core/models/service_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/list_item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/maps/list_item_maps_pin_model.dart';

class HomeBloc {
  final ListPlaceRepository _listPlaceRepository = ListPlaceRepository();
  final ListGalleryRepository _listGalleryRepository = ListGalleryRepository();
  final MapsRepository _mapsRepository = MapsRepository();

  final PublishSubject<ServiceModel<ListItemPlaceModel>> _listPlace = PublishSubject<ServiceModel<ListItemPlaceModel>>();
  final PublishSubject<ServiceModel<ListItemGalleryModel>> _listGallery = PublishSubject<ServiceModel<ListItemGalleryModel>>();
  final PublishSubject<ServiceModel<ListItemMapsPinModel>> _listItemMapsPin = PublishSubject<ServiceModel<ListItemMapsPinModel>>();

  Stream<ServiceModel<ListItemPlaceModel>> get streamListPlace => _listPlace.stream;

  Stream<ServiceModel<ListItemGalleryModel>> get streamListGallery => _listGallery.stream;

  Stream<ServiceModel<ListItemMapsPinModel>> get streamListItemMapsPins => _listItemMapsPin.stream;

  // request list place
  void getListPlace(ListPlaceType listPlaceType) {
    Future<ListItemPlaceModel> listPlace;
    try {
      switch (listPlaceType) {
        case ListPlaceType.ALL:
          listPlace = _listPlaceRepository.getListPlace();
          break;
        case ListPlaceType.MALANG:
          listPlace = _listPlaceRepository.getListPlaceKotaMalang();
          break;
        case ListPlaceType.KABMALANG:
          listPlace = _listPlaceRepository.getListPlaceKabMalang();
          break;
        case ListPlaceType.BATU:
          listPlace = _listPlaceRepository.getListPlaceKotaBatu();
          break;
      }
      listPlace.then((ListItemPlaceModel result) {
        _listPlace.sink.add(ServiceModel<ListItemPlaceModel>.completed(result));
      });
    } catch (e) {
      if (e is AppException) {
        _listPlace.sink.add(ServiceModel<ListItemPlaceModel>.dioError(e));
      } else {
        _listPlace.sink.add(ServiceModel<ListItemPlaceModel>.error('Unknown Exception'));
      }
    }
  }

  // request list gallery
  void getListGallery() {
    try {
      final Future<ListItemGalleryModel> listGallery = _listGalleryRepository.getListGallery();
      listGallery.then((ListItemGalleryModel result) {
        _listGallery.sink.add(ServiceModel<ListItemGalleryModel>.completed(result));
      });
    } catch (e) {
      if (e is AppException) {
        _listGallery.sink.add(ServiceModel<ListItemGalleryModel>.dioError(e));
      } else {
        _listGallery.sink.add(ServiceModel<ListItemGalleryModel>.error('Unknown Exception'));
      }
    }
  }

  // request list maps pin
  void getListMapsPin() {
    try {
      final Future<ListItemMapsPinModel> listMapsPin = _mapsRepository.getMapsPin();
      listMapsPin.then((ListItemMapsPinModel result) {
        _listItemMapsPin.sink.add(ServiceModel<ListItemMapsPinModel>.completed(result));
      });
    } catch (e) {
      if (e is AppException) {
        _listItemMapsPin.sink.add(ServiceModel<ListItemMapsPinModel>.dioError(e));
      } else {
        _listItemMapsPin.sink.add(ServiceModel<ListItemMapsPinModel>.error('Unknown Exception'));
      }
    }
  }

  void dispose() {
    print('Home Bloc # dispose');
    _listPlace.close();
    _listGallery.close();
    _listItemMapsPin.close();
  }
}
