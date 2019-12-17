import 'package:flutter/material.dart';
import '../blocs/list_place_provider.dart';
import '../models/list_place/list_item_place_model.dart';
import '../models/list_place/item_place_model.dart';
import '../models/service_model.dart';
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
        return StreamBuilder<ServiceModel<ListItemPlaceModel>>(
            stream: bloc.listPlace,
            builder: (BuildContext context, AsyncSnapshot<ServiceModel<ListItemPlaceModel>> snapshot){
                if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                        case Status.COMPLETED:
                            return ListView.builder(
                                itemCount: snapshot.data.data.listItemPlaceModel.length,
                                itemBuilder: (context, index) {
                                    ItemPlaceModel itemPlaceModel = snapshot.data.data.listItemPlaceModel[index];
                                    return ItemPlace(itemPlaceModel: itemPlaceModel);
                                }
                            );
                        break;
                        case Status.ERROR:
                            return Center(
                                child: Text(snapshot.data.message)
                            );
                        break;
                        case Status.DIOERROR:
                            return Center(
                                child: Text(snapshot.data.error.dioError.message)
                            );
                        break;
                    }
                }
                return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
                    )
                );
            }
        );
    }

}
