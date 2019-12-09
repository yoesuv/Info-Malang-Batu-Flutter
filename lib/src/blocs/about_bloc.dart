import 'package:rxdart/rxdart.dart';
import '../models/item_library_model.dart';

class AboutBloc {

    final _listLibraries = PublishSubject<List<ItemLibraryModel>>();

    Observable<List<ItemLibraryModel>> get listLibrary => _listLibraries.stream;

    createListLibrary() async {
        List<ItemLibraryModel> listLib = [];
        _listLibraries.sink.add(listLib);
    }

    dispose() {
        _listLibraries.close();
    }

}
