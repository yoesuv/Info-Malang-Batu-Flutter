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
        listLib.add(ItemLibraryModel(name: Libraries.cachedNetworkImage, url: Libraries.cachedNetworkImageUrl, license: Libraries.cachedNetworkImageLicense));
        listLib.add(ItemLibraryModel(name: Libraries.flutterHtml, url: Libraries.flutterHtmlUrl, license: Libraries.flutterHtmlLicense));
        listLib.add(ItemLibraryModel(name: Libraries.googleMapsFlutter, url: Libraries.googleMapsFlutterUrl, license: Libraries.googleMapsFlutterLicense));
        listLib.add(ItemLibraryModel(name: Libraries.http, url: Libraries.httpUrl, license: Libraries.httpLicense));
        listLib.add(ItemLibraryModel(name: Libraries.permissionHandler, url: Libraries.permissionHandlerUrl, license: Libraries.permissionHandlerLicense));
        return listLib;
    }

}
