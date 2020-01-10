import 'package:flutter/material.dart';
import '../blocs/about_bloc.dart';
import '../models/about/item_library_model.dart';
import '../widgets/item_library.dart';

class AboutLibraries extends StatelessWidget {

    final AboutBloc bloc = AboutBloc();

    Widget build(BuildContext context) {
        return Scaffold(
            body: buildListLibrary(bloc)
        );
    }

    Widget buildListLibrary(AboutBloc bloc) {
        List<ItemLibraryModel> listItemLibraryModel = bloc.createListLibrary();
        return ListView.builder(
            itemCount: listItemLibraryModel.length,
            itemBuilder: (context, index) {
                return ItemLibrary(itemLibraryModel: listItemLibraryModel[index]);
            }
        );
    }

}
