import 'package:flutter/material.dart';
import '../models/item_library_model.dart';

class ItemLibrary extends StatelessWidget {

    final ItemLibraryModel itemLibraryModel;

    ItemLibrary({this.itemLibraryModel});

    Widget build(BuildContext context) {
        return Column (
            children: <Widget>[
                Text('${itemLibraryModel.name}'),
                Text('${itemLibraryModel.url}'),
                Text('${itemLibraryModel.license}'),
                Divider()
            ]
        );
    }

}
