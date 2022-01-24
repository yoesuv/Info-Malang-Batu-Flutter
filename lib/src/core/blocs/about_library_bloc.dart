import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_library_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_library_state.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_library_model.dart';
import 'package:info_malang_batu_flutter/src/data/libraries.dart';

class AboutLibraryBloc extends Bloc<AboutLibraryEvent, AboutLibraryState> {
  AboutLibraryBloc() : super(const AboutLibraryState()){
    on<AboutLibraryEventInit>(_initListLibrary);
  }

  void _initListLibrary(AboutLibraryEventInit event, Emitter<AboutLibraryState> emit) {
    final listLibrary = [
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
    emit(state.copyWith(listItemLibrary: listLibrary));
  }

}