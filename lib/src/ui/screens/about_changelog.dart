import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_changelog_model.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_changelog.dart';

class AboutChangelog extends StatelessWidget {
  const AboutChangelog(this.bloc);

  final AboutBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildListChangelog());
  }

  Widget buildListChangelog() {
    return FutureBuilder<List<ItemChangelogModel>>(
      future: bloc.initListChangelog(),
      builder: (BuildContext context, AsyncSnapshot<List<ItemChangelogModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data![index];
                return ItemChangelog(item);
              });
        }
        return Center(
          child: Text('Memuat Changelog...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
