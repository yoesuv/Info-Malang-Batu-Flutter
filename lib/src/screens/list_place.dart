import 'package:flutter/material.dart';
import '../blocs/list_place_provider.dart';
import '../models/item_place_model.dart';

class ListPlace extends StatelessWidget {

    Widget build(BuildContext context) {

        final ListPlaceBloc bloc = ListPlaceProvider.of(context);
        bloc.getListPlace();

        return Scaffold(
            body: buildBody(bloc)
        );
    }

    Widget buildBody(ListPlaceBloc bloc) {
        return StreamBuilder(
            stream: bloc.listPlace,
            builder: (BuildContext context, AsyncSnapshot<List<ItemPlaceModel>> snapshot){
                if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator()
                    );
                }
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                        return Text(snapshot.data[index].nama);
                    }
                );
            }
        );
    }

}
