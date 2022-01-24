import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_changelog_model.dart';

class AboutChangelogState extends Equatable {
  final List<ItemChangelogModel>? listChangelog;

  const AboutChangelogState({this.listChangelog});

  AboutChangelogState copyWith({List<ItemChangelogModel>? listChangelog}) {
    return AboutChangelogState(
      listChangelog: listChangelog ?? this.listChangelog,
    );
  }

  @override
  List<Object?> get props => [ItemChangelogModel];
}