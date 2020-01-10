import 'package:rxdart/rxdart.dart';
import '../repositories/list_place_repository.dart';
import '../models/service_model.dart';
import '../models/list_place/list_item_place_model.dart';
import '../services/app_exceptions.dart';
import '../data/list_place_type.dart';

class ListPlaceBloc {

    final _listPlaceRepository = ListPlaceRepository();
    final _listPlace = PublishSubject<ServiceModel<ListItemPlaceModel>>();

    Stream<ServiceModel<ListItemPlaceModel>> get listPlace => _listPlace.stream;

    getListPlace(ListPlaceType listPlaceType) async {
        var listPlace;
        try {
            switch (listPlaceType) {
                case ListPlaceType.ALL:
                    listPlace = await _listPlaceRepository.getListPlace();
                break;
                case ListPlaceType.MALANG:
                    listPlace = await _listPlaceRepository.getListPlaceKotaMalang();
                break;
                case ListPlaceType.KABMALANG:
                    listPlace = await _listPlaceRepository.getListPlaceKabMalang();
                break;
                case ListPlaceType.BATU:
                    listPlace = await _listPlaceRepository.getListPlaceKotaBatu();
                break;
            }
            _listPlace.sink.add(ServiceModel.completed(listPlace));
        } catch (e) {
            if (e is AppException) {
                _listPlace.sink.add(ServiceModel.dioError(e));
            } else {
                _listPlace.sink.add(ServiceModel.error('Unknown Exception'));
            }
        }
    }

    dispose() {
        _listPlace.close();
    }

}
