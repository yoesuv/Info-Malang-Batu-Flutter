import 'package:flutter/material.dart';
import '../blocs/list_place_provider.dart';
import '../models/list_place/list_item_place_model.dart';
import '../models/list_place/item_place_model.dart';
import '../widgets/item_place.dart';

class ListPlace extends StatelessWidget {

    Widget build(BuildContext context) {

        final ListPlaceBloc bloc = ListPlaceProvider.of(context);
        bloc.getListPlace();

        return Scaffold(
            appBar: AppBar(
                title: Text('Lokasi', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
            ),
            body: buildBody(bloc)
        );
    }

    Widget buildBody(ListPlaceBloc bloc) {
        return StreamBuilder(
            stream: bloc.listPlace,
            builder: (BuildContext context, AsyncSnapshot<ListItemPlaceModel> snapshot){
                if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator()
                    );
                }
                return ListView.builder(
                    itemCount: snapshot.data.listItemPlaceModel.length,
                    itemBuilder: (context, index) {
                        ItemPlaceModel itemPlaceModel = snapshot.data.listItemPlaceModel[index];
                        return ItemPlace(itemPlaceModel: itemPlaceModel);
                    }
                );
            }
        );
    }

}
