import 'package:rxdart/rxdart.dart';
import '../repositories/list_place_repository.dart';
import '../models/service_model.dart';
import '../models/list_place/list_item_place_model.dart';
import '../services/app_exceptions.dart';

class ListPlaceBloc {

    final _listPlaceRepository = ListPlaceRepository();
    final _listPlace = PublishSubject<ServiceModel<ListItemPlaceModel>>();

    Stream<ServiceModel<ListItemPlaceModel>> get listPlace => _listPlace.stream;

    getListPlace() async {
        try {
            final listPlace = await _listPlaceRepository.getListPlace();
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
