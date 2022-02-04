import 'package:equatable/equatable.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_library_model.dart';

class AboutLibraryState extends Equatable {
  final List<ItemLibraryModel>? listItemLibrary;

  const AboutLibraryState({this.listItemLibrary});

  AboutLibraryState copyWith({List<ItemLibraryModel>? listItemLibrary}) {
    return AboutLibraryState(
      listItemLibrary: listItemLibrary ?? this.listItemLibrary,
    );
  }

  @override
  List<Object?> get props => [listItemLibrary];
}