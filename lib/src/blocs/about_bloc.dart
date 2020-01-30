import '../data/libraries.dart';
import '../models/about/item_changelog_model.dart';
import '../models/about/item_library_model.dart';

class AboutBloc {

    List<ItemChangelogModel> createListChangelog() {
        return <ItemChangelogModel>[
            ItemChangelogModel(version: 'Versi 1.0.4', changelog: '- improve performance'),
            ItemChangelogModel(version: 'Versi 1.0.3', changelog: '- menu filter list place\n- add error reporting\n- update libraries'),
            ItemChangelogModel(version: 'Versi 1.0.2', changelog: '- improve performance'),
            ItemChangelogModel(version: 'Versi 1.0.1', changelog: '- add splash screen\n- improve performance'),
            ItemChangelogModel(version: 'Versi 1.0.0', changelog: '- initial release')
        ];
    }

    List<ItemLibraryModel> createListLibrary() {
        return <ItemLibraryModel>[
            ItemLibraryModel(flutter, flutterUrl, flutterLicense),
            ItemLibraryModel(cachedNetworkImage,  cachedNetworkImageUrl,  cachedNetworkImageLicense),
            ItemLibraryModel(deviceInfo, deviceInfoUrl, deviceInfoLicense),
            ItemLibraryModel(dio, dioUrl, dioLicense),
            ItemLibraryModel(flutterHtml, flutterHtmlUrl, flutterHtmlLicense),
            ItemLibraryModel(googleMapsFlutter, googleMapsFlutterUrl, googleMapsFlutterLicense),
            ItemLibraryModel(permissionHandler, permissionHandlerUrl, permissionHandlerLicense),
            ItemLibraryModel(provider, providerUrl, providerLicense),
            ItemLibraryModel(sentry, sentryUrl, sentryLicense)
        ];
    }

}