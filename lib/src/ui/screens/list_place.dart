import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:info_malang_batu_flutter/src/core/blocs/list_place_bloc.dart';
import 'package:info_malang_batu_flutter/src/core/events/list_place_event.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/core/states/list_place_state.dart';
import 'package:info_malang_batu_flutter/src/data/list_place_type.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/error_container.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/item_place.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class ListPlace extends StatefulWidget {
  const ListPlace({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListPlaceState();
  }
}

class _ListPlaceState extends State<ListPlace> {
  late ListPlaceBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ListPlaceBloc>();
    _bloc.add(ListPlaceEventInit(ListPlaceType.ALL));
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
        if (state.status == FormzSubmissionStatus.inProgress) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          );
        } else if (state.status == FormzSubmissionStatus.failure) {
          return ErrorContainer(
            title: 'Failed Load List Place',
            onPress: () {
              _bloc.add(ListPlaceEventInit(ListPlaceType.ALL));
            },
          );
        }
        return _buildList(state.listPlace);
      },
    );
  }

  Widget _buildList(List<ItemPlaceModel>? places) {
    return ListView.builder(
      itemCount: places?.length,
      itemBuilder: (BuildContext context, int index) {
        final itemPlaceModel = places?[index];
        return ItemPlace(itemPlaceModel: itemPlaceModel);
      },
    );
  }
}
