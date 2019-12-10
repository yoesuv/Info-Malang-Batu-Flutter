import 'package:flutter/material.dart';
import '../models/item_library_model.dart';

class ItemLibrary extends StatelessWidget {

    final ItemLibraryModel itemLibraryModel;

    ItemLibrary({this.itemLibraryModel});

    Widget build(BuildContext context) {
        return Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text('${itemLibraryModel.name}', style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                )),
                Text('${itemLibraryModel.url}', style: TextStyle(
                    color: Colors.teal,
                    fontSize: 14.0,
                )),
                Text('${itemLibraryModel.license}', style: TextStyle(
                    fontSize: 12.0,
                )),
                Divider()
            ]
        );
    }

}
