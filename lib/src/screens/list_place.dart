import 'package:flutter/material.dart';
import '../blocs/list_place_bloc.dart';
import '../data/list_place_type.dart';
import '../models/list_place/item_place_model.dart';
import '../models/list_place/list_item_place_model.dart';
import '../models/service_model.dart';
import '../widgets/item_place.dart';

class ListPlace extends StatefulWidget {

    const ListPlace({Key key}) : super(key: key);
    @override
    ListPlaceState createState() => ListPlaceState();

}

class ListPlaceState extends State<ListPlace> {

    ListPlaceBloc bloc = ListPlaceBloc();
    ListPlaceType _listPlaceType = ListPlaceType.ALL;

    @override
    void initState(){
        super.initState();
        bloc.getListPlace(_listPlaceType);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Lokasi', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
                actions: <Widget>[
                    PopupMenuButton<ListPlaceType>(
                        onSelected: (ListPlaceType result) {
                            setState(() {
                                _listPlaceType = result;
                            });
                            bloc.getListPlace(_listPlaceType);
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<ListPlaceType>>[
                            const PopupMenuItem(
                                value: ListPlaceType.ALL,
                                child: Text('Semua'),
                            ),
                            const PopupMenuItem(
                                value: ListPlaceType.MALANG,
                                child: Text('Kota Malang'),
                            ),
                            const PopupMenuItem(
                                value: ListPlaceType.BATU,
                                child: Text('Kota Batu'),
                            ),
                            const PopupMenuItem(
                                value: ListPlaceType.KABMALANG,
                                child: Text('Kab. Malang'),
                            )
                        ]
                    )
                ]
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
                            return buildList(snapshot.data.data);
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

    Widget buildList(ListItemPlaceModel model) {
        return ListView.builder(
            itemCount: model.listItemPlaceModel.length,
            itemBuilder: (BuildContext context, int index) {
                final ItemPlaceModel itemPlaceModel = model.listItemPlaceModel[index];
                return ItemPlace(itemPlaceModel: itemPlaceModel);
            }
        );
    }

    @override
    void dispose(){
        bloc.dispose();
        super.dispose();
    }

}
