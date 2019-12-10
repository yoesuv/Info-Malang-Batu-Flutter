import 'package:flutter/material.dart';
import '../blocs/about_provider.dart';
import '../models/item_changelog_model.dart';
import '../widgets/item_changelog.dart';

class AboutChangelog extends StatelessWidget {

    Widget build(BuildContext context) {

        final AboutBloc bloc = AboutProvider.of(context);
        bloc.createListChangelog();

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
