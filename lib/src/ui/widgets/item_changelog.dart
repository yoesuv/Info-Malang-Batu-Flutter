import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_changelog_model.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';

class ItemChangelog extends StatelessWidget {
  const ItemChangelog({super.key, this.itemChangelogModel});

  final ItemChangelogModel? itemChangelogModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: itemChangelogPadding,
            right: itemChangelogPadding,
            top: itemChangelogPadding,
          ),
          child: Text(
            itemChangelogModel?.version ?? '',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(itemChangelogPadding),
          child: Text(
            itemChangelogModel?.changelog ?? '',
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Divider()
      ],
    );
  }
}
