import 'package:flutter/material.dart';
import '../data/dimens.dart';
import '../models/about/item_changelog_model.dart';

class ItemChangelog extends StatelessWidget {

    const ItemChangelog({this.itemChangelogModel});

    final ItemChangelogModel itemChangelogModel;

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: itemChangelogPadding, right: itemChangelogPadding, top: itemChangelogPadding),
                    child: Text(itemChangelogModel.version, style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    )),
                ),
                Container(
                    padding: EdgeInsets.all(itemChangelogPadding),
                    child: Text(itemChangelogModel.changelog, style: const TextStyle(
                        fontSize: 14.0
                    )),
                ),
                const Divider()
            ],
        );
    }

}
