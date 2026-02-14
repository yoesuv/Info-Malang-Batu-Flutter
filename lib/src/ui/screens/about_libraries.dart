import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_library_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/about_library_event.dart';
import 'package:info_malang_batu_flutter/src/core/states/about_library_state.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_library.dart';

class AboutLibraries extends StatefulWidget {
  const AboutLibraries({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AboutLibrariesState();
  }
}

class _AboutLibrariesState extends State<AboutLibraries> {
  late AboutLibraryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AboutLibraryBloc()..add(AboutLibraryEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildListLibrary());
  }

  Widget _buildListLibrary() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, AboutLibraryState state) {
        if (state.listItemLibrary != null) {
          return ListView.builder(
            itemCount: state.listItemLibrary?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final item = state.listItemLibrary![index];
              return ItemLibrary(item);
            },
          );
        }
        return const Center(
          child: Text(
            'Memuat List Library...',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
