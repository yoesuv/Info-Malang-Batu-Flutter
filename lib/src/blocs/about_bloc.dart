import 'package:rxdart/rxdart.dart';
import 'package:info_malang_batu_flutter/src/data/libraries.dart';
import 'package:info_malang_batu_flutter/src/models/about/item_changelog_model.dart';
import 'package:info_malang_batu_flutter/src/models/about/item_library_model.dart';

class AboutBloc {

    final PublishSubject<List<ItemLibraryModel>> _listLibrary = PublishSubject<List<ItemLibraryModel>>();

    Stream<List<ItemLibraryModel>> get streamListLibrary => _listLibrary.stream;

    void initListLibrary() {
        final List<ItemLibraryModel> listLibrary = <ItemLibraryModel>[
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
        _listLibrary.sink.add(listLibrary);
    }

    List<ItemChangelogModel> createListChangelog() {
        return <ItemChangelogModel>[
            ItemChangelogModel(version: 'Versi 1.0.4', changelog: '- improve performance'),
            ItemChangelogModel(version: 'Versi 1.0.3', changelog: '- menu filter list place\n- add error reporting\n- update libraries'),
            ItemChangelogModel(version: 'Versi 1.0.2', changelog: '- improve performance'),
            ItemChangelogModel(version: 'Versi 1.0.1', changelog: '- add splash screen\n- improve performance'),
            ItemChangelogModel(version: 'Versi 1.0.0', changelog: '- initial release')
        ];
    }

}