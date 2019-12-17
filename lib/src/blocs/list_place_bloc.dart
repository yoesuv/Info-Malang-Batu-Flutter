import 'package:rxdart/rxdart.dart';
import '../repositories/list_place_repository.dart';
import '../models/list_place/list_item_place_model.dart';

class ListPlaceBloc {

    final _listPlaceRepository = ListPlaceRepository();
    final _listPlace = PublishSubject<ListItemPlaceModel>();

    Observable<ListItemPlaceModel> get listPlace => _listPlace.stream;

    getListPlace() async {
        try {
            final listPlace = await _listPlaceRepository.getListPlace();
            _listPlace.sink.add(listPlace);
        } catch (e) {
            print('ListPlaceBloc # $e');
        }

    }

    dispose() {
        _listPlace.close();
    }

}
