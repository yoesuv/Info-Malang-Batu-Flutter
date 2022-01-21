import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_place.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class ListPlace extends StatefulWidget {

    const ListPlace({Key? key}) : super(key: key);

    @override
    ListPlaceState createState() => ListPlaceState();

}

class ListPlaceState extends State<ListPlace> {

    late ListPlaceBloc _bloc;

    @override
    void initState(){
        super.initState();
        _bloc = context.read<ListPlaceBloc>()..add(ListPlaceEventInit(ListPlaceType.ALL));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const MyAppBarText(title: 'Lokasi'),
                actions: <Widget>[
                    PopupMenuButton<ListPlaceType>(
                        onSelected: (ListPlaceType result) {

                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<ListPlaceType>>[
                            const PopupMenuItem<ListPlaceType>(
                                value: ListPlaceType.ALL,
                                child: Text('Semua'),
                            ),
                            const PopupMenuItem<ListPlaceType>(
                                value: ListPlaceType.MALANG,
                                child: Text('Kota Malang'),
                            ),
                            const PopupMenuItem<ListPlaceType>(
                                value: ListPlaceType.BATU,
                                child: Text('Kota Batu'),
                            ),
                            const PopupMenuItem<ListPlaceType>(
                                value: ListPlaceType.KABMALANG,
                                child: Text('Kab. Malang'),
                            )
                        ]
                    )
                ]
            ),
            body: buildBody()
        );
    }

    Widget buildBody() {
        return BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
                return Container();
            },
        );
        /*return StreamBuilder<ServiceModel<ListItemPlaceModel>>(
            stream: bloc.streamListPlace,
            builder: (BuildContext context, AsyncSnapshot<ServiceModel<ListItemPlaceModel>> snapshot){
                if (snapshot.hasData) {
                    switch (snapshot.data!.status!) {
                        case Status.COMPLETED:
                            return buildList(snapshot.data!.data!);
                        case Status.ERROR:
                            return Center(
                                child: Text(snapshot.data!.message!)
                            );
                        case Status.DIOERROR:
                            return Center(
                                child: Text(snapshot.data?.error?.dioError?.message ?? '')
                            );
                    }
                }
                return const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
                    )
                );
            }
        );*/
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

}