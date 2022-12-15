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
      ItemLibraryModel(blocLibrary, blocLibraryUrl, blocLibraryLicense),
      ItemLibraryModel(cachedNetworkImage, cachedNetworkImageUrl, cachedNetworkImageLicense),
      ItemLibraryModel(dio, dioUrl, dioLicense),
      ItemLibraryModel(equatable, equatableUrl, equatableLicense),
      ItemLibraryModel(flutterHtml, flutterHtmlUrl, flutterHtmlLicense),
      ItemLibraryModel(googleMapsFlutter, googleMapsFlutterUrl, googleMapsFlutterLicense),
      ItemLibraryModel(packageInfoPlus, packageInfoPlusUrl, packageInfoPlusLicense),
      ItemLibraryModel(permissionHandler, permissionHandlerUrl, permissionHandlerLicense),
    ];
    emit(state.copyWith(listItemLibrary: listLibrary));
  }

}