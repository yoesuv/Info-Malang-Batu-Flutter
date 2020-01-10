import 'package:flutter/material.dart';
import '../blocs/about_bloc.dart';
import '../models/about/item_changelog_model.dart';
import '../widgets/item_changelog.dart';

class AboutChangelog extends StatelessWidget {

    final AboutBloc bloc = AboutBloc();

    Widget build(BuildContext context) {
        return Scaffold(
            body: buildListChangelog(bloc)
        );
    }

    Widget buildListChangelog(AboutBloc bloc) {
        List<ItemChangelogModel> listChangelog = bloc.createListChangelog();
        return ListView.builder(
            itemCount: listChangelog.length,
            itemBuilder: (context, index) {
                return ItemChangelog(itemChangelogModel: listChangelog[index]);
            }
        );
    }

}
