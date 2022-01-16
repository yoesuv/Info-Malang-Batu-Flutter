import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/about_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/models/about/item_library_model.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_library.dart';

class AboutLibraries extends StatelessWidget {

    const AboutLibraries(this.bloc);

    final AboutBloc bloc;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: buildListLibrary()
        );
    }

    Widget buildListLibrary() {
        return FutureBuilder<List<ItemLibraryModel>>(
            future: bloc.initListLibrary(),
            builder: (BuildContext context, AsyncSnapshot<List<ItemLibraryModel>> snapshot) {
                if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                            return ItemLibrary(snapshot.data![index]);
                        }
                    );
                }
                return Center(
                    child: Text('Memuat List Library...', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),
                );
            },
        );
    }

}