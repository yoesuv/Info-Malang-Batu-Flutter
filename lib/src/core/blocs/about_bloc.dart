import 'package:info_malang_batu_flutter/src/core/models/about/item_changelog_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_library_model.dart';
import 'package:info_malang_batu_flutter/src/data/libraries.dart';

class AboutBloc {
  Future<List<ItemLibraryModel>> initListLibrary() async {
    return <ItemLibraryModel>[
      ItemLibraryModel(flutter, flutterUrl, flutterLicense),
      ItemLibraryModel(cachedNetworkImage, cachedNetworkImageUrl, cachedNetworkImageLicense),
      ItemLibraryModel(deviceInfo, deviceInfoUrl, deviceInfoLicense),
      ItemLibraryModel(dio, dioUrl, dioLicense),
      ItemLibraryModel(flutterHtml, flutterHtmlUrl, flutterHtmlLicense),
      ItemLibraryModel(googleMapsFlutter, googleMapsFlutterUrl, googleMapsFlutterLicense),
      ItemLibraryModel(permissionHandler, permissionHandlerUrl, permissionHandlerLicense),
      ItemLibraryModel(provider, providerUrl, providerLicense),
      ItemLibraryModel(rxDart, rxDartUrl, rxDartLicense),
      ItemLibraryModel(sentry, sentryUrl, sentryLicense)
    ];
  }

  Future<List<ItemChangelogModel>> initListChangelog() async {
    return <ItemChangelogModel>[
      ItemChangelogModel(version: 'Versi 1.0.5', changelog: '• improve performance\n• improve logic'),
      ItemChangelogModel(version: 'Versi 1.0.4', changelog: '• improve performance'),
      ItemChangelogModel(version: 'Versi 1.0.3', changelog: '• menu filter list place\n• add error reporting\n• update libraries'),
      ItemChangelogModel(version: 'Versi 1.0.2', changelog: '• improve performance'),
      ItemChangelogModel(version: 'Versi 1.0.1', changelog: '• add splash screen\n• improve performance'),
      ItemChangelogModel(version: 'Versi 1.0.0', changelog: '• initial release')
    ];
  }
}
