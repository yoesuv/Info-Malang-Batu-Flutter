import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/blocs/about_bloc.dart';
import 'package:info_malang_batu_flutter/src/models/about/item_changelog_model.dart';
import 'package:info_malang_batu_flutter/src/widgets/item_changelog.dart';

class AboutChangelog extends StatelessWidget {

    const AboutChangelog(this.bloc);

    final AboutBloc bloc;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: buildListChangelog()
        );
    }

    Widget buildListChangelog() {
        return FutureBuilder<List<ItemChangelogModel>>(
            future: bloc.initListChangelog(),
            builder: (BuildContext context, AsyncSnapshot<List<ItemChangelogModel>> snapshot) {
                if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                            return ItemChangelog(snapshot.data[index]);
                        }
                    );
                }
                return Center(
                    child: Text('Memuat Changelog...', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),
                );
            },
        );
    }

}