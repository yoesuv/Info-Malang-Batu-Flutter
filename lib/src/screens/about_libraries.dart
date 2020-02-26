import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:info_malang_batu_flutter/src/blocs/about_bloc.dart';
import 'package:info_malang_batu_flutter/src/models/about/item_library_model.dart';
import 'package:info_malang_batu_flutter/src/widgets/item_library.dart';

class AboutLibraries extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        final AboutBloc bloc = Provider.of<AboutBloc>(context, listen: false);
        bloc.initListLibrary();
        return Scaffold(
            body: buildListLibrary(bloc)
        );
    }

    Widget buildListLibrary(AboutBloc bloc) {
        return StreamBuilder<List<ItemLibraryModel>>(
            stream: bloc.streamListLibrary,
            builder: (BuildContext context, AsyncSnapshot<List<ItemLibraryModel>> snapshot) {
                if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                            return ItemLibrary(snapshot.data[index]);
                        }
                    );
                } else {
                    return Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
                        )
                    );
                }
            },
        );
    }

}