import 'package:rxdart/rxdart.dart';
import '../resources/list_place_provider.dart';
import '../models/list_place/list_item_place_model.dart';

class ListPlaceBloc {

    final _listPlaceProvider = ListPlaceProvider();
    final _listPlace = PublishSubject<ListItemPlaceModel>();

    Observable<ListItemPlaceModel> get listPlace => _listPlace.stream;

    getListPlace() async {
        final listPlace = await _listPlaceProvider.getListPlace();
        _listPlace.sink.add(listPlace);
    }

    dispose() {
        _listPlace.close();
    }

}
