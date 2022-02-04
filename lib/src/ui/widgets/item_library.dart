import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_library_model.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';

class ItemLibrary extends StatelessWidget {
  const ItemLibrary(this.itemLibraryModel, {Key? key}) : super(key: key);

  final ItemLibraryModel itemLibraryModel;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
          padding: EdgeInsets.only(left: itemLibraryPadding, right: itemLibraryPadding, top: itemLibraryPadding),
          child: Text('${itemLibraryModel.name}', style: const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold))),
      Container(
          padding: EdgeInsets.only(left: itemLibraryPadding, right: itemLibraryPadding, top: itemLibraryPadding),
          child: Text('${itemLibraryModel.url}',
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 14.0,
              ))),
      Container(
        padding: EdgeInsets.all(itemLibraryPadding),
        child: Html(
          data: itemLibraryModel.license,
          style: {
            "body": Style(fontSize: const FontSize(11), fontFamily: 'Consola'),
          },
        ),
      ),
      const Divider()
    ]);
  }
}
