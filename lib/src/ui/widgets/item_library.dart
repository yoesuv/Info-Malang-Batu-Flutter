import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_library_model.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';

class ItemLibrary extends StatelessWidget {

    const ItemLibrary(this.itemLibraryModel);

    final ItemLibraryModel itemLibraryModel;

    @override
    Widget build(BuildContext context) {
        return Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: itemLibraryPadding, right: itemLibraryPadding, top: itemLibraryPadding),
                    child: Text('${itemLibraryModel.name}', style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ))
                ),
                Container(
                    padding: EdgeInsets.only(left: itemLibraryPadding, right: itemLibraryPadding, top: itemLibraryPadding),
                    child: Text('${itemLibraryModel.url}', style: TextStyle(
                        color: Colors.teal,
                        fontSize: 14.0,
                    ))
                ),
                Container(
                    padding: EdgeInsets.all(itemLibraryPadding),
                    child: Html(
                        data: itemLibraryModel.license,
                        defaultTextStyle: const TextStyle(
                            fontSize: 11.0,
                            fontFamily: 'Consola'
                        ),
                    )
                ),
                const Divider()
            ]
        );
    }

}