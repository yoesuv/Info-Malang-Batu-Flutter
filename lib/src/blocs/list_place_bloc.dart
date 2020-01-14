import 'package:rxdart/rxdart.dart';
import '../data/list_place_type.dart';
import '../models/list_place/list_item_place_model.dart';
import '../models/service_model.dart';
import '../repositories/list_place_repository.dart';
import '../services/app_exceptions.dart';

class ListPlaceBloc {

    final ListPlaceRepository _listPlaceRepository = ListPlaceRepository();
    final PublishSubject<ServiceModel<ListItemPlaceModel>> _listPlace = PublishSubject<ServiceModel<ListItemPlaceModel>>();

    Stream<ServiceModel<ListItemPlaceModel>> get listPlace => _listPlace.stream;

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
            if (!_listPlace.isClosed){
                listPlace.then((ListItemPlaceModel result){
                    _listPlace.sink.add(ServiceModel<ListItemPlaceModel>.completed(result));
                });
            }
        } catch (e) {
            if (e is AppException) {
                if (!_listPlace.isClosed){
                    _listPlace.sink.add(ServiceModel<ListItemPlaceModel>.dioError(e));
                }
            } else {
                if (!_listPlace.isClosed){
                    _listPlace.sink.add(ServiceModel<ListItemPlaceModel>.error('Unknown Exception'));
                }
            }
        }
    }

    void dispose() {
        if (!_listPlace.isClosed) {
            _listPlace.close();
        }
    }

}
