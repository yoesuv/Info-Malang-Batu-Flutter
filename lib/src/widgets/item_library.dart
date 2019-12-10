import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../models/item_library_model.dart';
import '../data/dimens.dart';


class ItemLibrary extends StatelessWidget {

    final ItemLibraryModel itemLibraryModel;

    ItemLibrary({this.itemLibraryModel});

    Widget build(BuildContext context) {
        return Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: Dimens.itemLibraryPadding, right: Dimens.itemLibraryPadding, top: Dimens.itemLibraryPadding),
                    child: Text('${itemLibraryModel.name}', style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ))
                ),
                Container(
                    padding: EdgeInsets.only(left: Dimens.itemLibraryPadding, right: Dimens.itemLibraryPadding, top: Dimens.itemLibraryPadding),
                    child: Text('${itemLibraryModel.url}', style: TextStyle(
                        color: Colors.teal,
                        fontSize: 14.0,
                    ))
                ),
                Container(
                    padding: EdgeInsets.all(Dimens.itemLibraryPadding),
                    child: Html(
                        data: itemLibraryModel.license,
                        defaultTextStyle: TextStyle(
                            fontSize: 11.0,
                            fontFamily: 'Consola'
                        ),
                    )
                ),
                Divider()
            ]
        );
    }

}
