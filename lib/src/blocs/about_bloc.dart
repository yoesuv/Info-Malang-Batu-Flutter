import '../models/about/item_library_model.dart';
import '../models/about/item_changelog_model.dart';
import '../data/libraries.dart';
import '../blocs/bloc.dart';

class AboutBloc extends Bloc {

    List<ItemChangelogModel> createListChangelog() {
        List<ItemChangelogModel> listChangelog = [];
        listChangelog.add(ItemChangelogModel(version: "Versi 1.0.1", changelog: "- add splash screen"));
        listChangelog.add(ItemChangelogModel(version: "Versi 1.0.0", changelog: "- initial release"));
        return listChangelog;
    }

    List<ItemLibraryModel> createListLibrary() {
        List<ItemLibraryModel> listLib = [];
        listLib.add(ItemLibraryModel(name: Libraries.flutter, url: Libraries.flutterUrl, license: Libraries.flutterLicense));
        listLib.add(ItemLibraryModel(name: Libraries.cachedNetworkImage, url: Libraries.cachedNetworkImageUrl, license: Libraries.cachedNetworkImageLicense));
        listLib.add(ItemLibraryModel(name: Libraries.dio, url: Libraries.dioUrl, license: Libraries.dioLicense));
        listLib.add(ItemLibraryModel(name: Libraries.flutterHtml, url: Libraries.flutterHtmlUrl, license: Libraries.flutterHtmlLicense));
        listLib.add(ItemLibraryModel(name: Libraries.googleMapsFlutter, url: Libraries.googleMapsFlutterUrl, license: Libraries.googleMapsFlutterLicense));
        listLib.add(ItemLibraryModel(name: Libraries.permissionHandler, url: Libraries.permissionHandlerUrl, license: Libraries.permissionHandlerLicense));
        return listLib;
    }

    dispose() {

    }

}
