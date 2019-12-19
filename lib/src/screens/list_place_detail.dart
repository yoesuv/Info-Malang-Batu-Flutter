import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/list_place/item_place_model.dart';
import '../data/dimens.dart';
import '../data/constants.dart';

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
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        height: Dimens.imageDetailHeight,
                        child: CachedNetworkImage(
                            imageUrl: itemPlaceModel.gambar,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Image.asset(Constants.placeHolderImage, fit: BoxFit.cover),
                            errorWidget: (context, url, error) => Icon(Icons.error)
                        )
                    ),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            itemPlaceModel.nama,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.start
                        )
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                            itemPlaceModel.deskripsi,
                            style: TextStyle(
                                fontSize: 14.0
                            ),
                            textAlign: TextAlign.start
                        )
                    )
                ],
            )
        );
    }

}
