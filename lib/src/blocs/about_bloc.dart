import '../models/item_library_model.dart';
import '../data/libraries.dart';

class AboutBloc {

    List<ItemLibraryModel> createListLibrary() {
        List<ItemLibraryModel> listLib = [];
        listLib.add(ItemLibraryModel(name: Libraries.flutter, url: Libraries.flutterUrl, license: Libraries.flutterLicense));
        return listLib;
    }

}
