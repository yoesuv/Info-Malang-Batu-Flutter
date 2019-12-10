import 'package:flutter/material.dart';
import '../models/item_changelog_model.dart';
import '../data/dimens.dart';

class ItemChangelog extends StatelessWidget {

    final ItemChangelogModel itemChangelogModel;

    ItemChangelog({this.itemChangelogModel});

    Widget build(context) {
        return Column(
            children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: Dimens.itemChangelogPadding, right: Dimens.itemChangelogPadding, top: Dimens.itemChangelogPadding),
                    child: Text(itemChangelogModel.version, style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    )),
                ),
                Container(
                    padding: EdgeInsets.all(Dimens.itemChangelogPadding),
                    child: Text(itemChangelogModel.version, style: TextStyle(
                        fontSize: 14.0
                    )),
                ),
                Divider()
            ],
        );
    }

}
