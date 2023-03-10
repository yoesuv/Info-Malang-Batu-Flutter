import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/list_item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_place.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class ListPlace extends StatefulWidget {
  const ListPlace({Key? key}) : super(key: key);

  @override
  _ListPlaceState createState() => _ListPlaceState();
}

class _ListPlaceState extends State<ListPlace> {
  late ListPlaceBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ListPlaceBloc>()..add(ListPlaceEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyAppBarText(title: 'Lokasi'),
        actions: <Widget>[
          PopupMenuButton<ListPlaceType>(
            onSelected: (ListPlaceType result) {
              _bloc.add(ListPlaceEventLocationChanged(result));
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<ListPlaceType>>[
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
              ),
            ],
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ListPlaceBloc, ListPlaceState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state.listItemPlaceModel != null) {
          return _buildList(state.listItemPlaceModel);
        }
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ),
        );
      },
    );
  }

  Widget _buildList(ListItemPlaceModel? model) {
    return ListView.builder(
      itemCount: model?.listItemPlaceModel.length,
      itemBuilder: (BuildContext context, int index) {
        final itemPlaceModel = model?.listItemPlaceModel[index];
        return ItemPlace(itemPlaceModel: itemPlaceModel);
      },
    );
  }
}
