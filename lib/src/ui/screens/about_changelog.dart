import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_changelog_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_changelog_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_changelog_state.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_changelog.dart';

class AboutChangelog extends StatefulWidget {
  const AboutChangelog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutChangelogState();
  }
}

class _AboutChangelogState extends State<AboutChangelog> {

  late AboutChangelogBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AboutChangelogBloc()..add(AboutChangelogEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildListChangelog());
  }

  Widget _buildListChangelog() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, AboutChangelogState state) {
        if (state.listChangelog != null) {
          return ListView.builder(
            itemCount: state.listChangelog?.length ?? 0,
            itemBuilder: (context, int index) {
              final item = state.listChangelog![index];
              return ItemChangelog(item);
            },
          );
        }
        return const Center(
          child: Text('Memuat Changelog...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
