import '../models/item_library_model.dart';
import '../models/item_changelog_model.dart';
import '../data/libraries.dart';

class AboutBloc {

    List<ItemChangelogModel> createListChangelog() {
        List<ItemChangelogModel> listChangelog = [];
        listChangelog.add(ItemChangelogModel(version: "1.0.0", changelog: "- initial release"));
        return listChangelog;
    }

    List<ItemLibraryModel> createListLibrary() {
        List<ItemLibraryModel> listLib = [];
        listLib.add(ItemLibraryModel(name: Libraries.flutter, url: Libraries.flutterUrl, license: Libraries.flutterLicense));
        return listLib;
    }

}
