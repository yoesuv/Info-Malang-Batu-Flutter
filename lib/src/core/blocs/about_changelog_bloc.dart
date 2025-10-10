import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_changelog_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_changelog_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_changelog_state.dart';

class AboutChangelogBloc extends Bloc<AboutChangelogEvent, AboutChangelogState> {
  AboutChangelogBloc() : super(const AboutChangelogState()){
    on<AboutChangelogEventInit>(_initListChangelog);
  }

  void _initListChangelog(AboutChangelogEventInit event, Emitter<AboutChangelogState> emit) {
    final listChangelog = [
      ItemChangelogModel(version: 'Versi 2.0.7', changelog: '• update libraries'),
      ItemChangelogModel(version: 'Versi 2.0.6', changelog: '• update libraries'),
      ItemChangelogModel(version: 'Versi 2.0.5', changelog: '• update libraries'),
      ItemChangelogModel(version: 'Versi 2.0.4', changelog: '• update libraries\n• support newest android & iOS'),
      ItemChangelogModel(version: 'Versi 2.0.3', changelog: '• update libraries'),
      ItemChangelogModel(version: 'Versi 2.0.2', changelog: '• update libraries'),
      ItemChangelogModel(version: 'Versi 2.0.1', changelog: '• update libraries\n• support newest android & iOS'),
      ItemChangelogModel(version: 'Versi 2.0.0', changelog: '• refactor code'),
      ItemChangelogModel(version: 'Versi 1.1.0', changelog: '• improve performance\n• improve logic\n• refactor code'),
      ItemChangelogModel(version: 'Versi 1.0.5', changelog: '• improve performance\n• improve logic'),
      ItemChangelogModel(version: 'Versi 1.0.4', changelog: '• improve performance'),
      ItemChangelogModel(version: 'Versi 1.0.3', changelog: '• menu filter list place\n• add error reporting\n• update libraries'),
      ItemChangelogModel(version: 'Versi 1.0.2', changelog: '• improve performance'),
      ItemChangelogModel(version: 'Versi 1.0.1', changelog: '• add splash screen\n• improve performance'),
      ItemChangelogModel(version: 'Versi 1.0.0', changelog: '• initial release')
    ];
    emit(state.copyWith(listChangelog: listChangelog));
  }
}