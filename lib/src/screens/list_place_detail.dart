import 'package:flutter/material.dart';
import '../models/item_place_model.dart';

class ListPlaceDetail extends StatelessWidget {

    static const String routeListPlaceDetail = '/detailPlace';
    final ItemPlaceModel itemPlaceModel;

    const ListPlaceDetail({Key key, @required this.itemPlaceModel}): super(key: key);

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Detail Lokasi', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
            ),
            body: Center(
                child: Text(itemPlaceModel.nama)
            ),
        );
    }

}
