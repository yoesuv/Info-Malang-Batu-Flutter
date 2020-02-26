import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';
import 'package:info_malang_batu_flutter/src/models/list_place/item_place_model.dart';

class ItemPlace extends StatelessWidget {

    const ItemPlace({this.itemPlaceModel});

    final ItemPlaceModel itemPlaceModel;

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: () {
                Navigator.pushNamed(context, '/detailPlace', arguments: itemPlaceModel);
            },
            child: Stack (
                children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        height: itemListPlaceHeight,
                        child: CachedNetworkImage(
                            imageUrl: itemPlaceModel.gambar,
                            fit: BoxFit.cover,
                            placeholder: (BuildContext context, String url) => Image.asset(placeHolderImage, fit: BoxFit.cover),
                            errorWidget: (BuildContext context, String url, Object error) => Icon(Icons.error)
                        )
                    ),
                    Container(
                        width: double.infinity,
                        height: itemListPlaceHeight,
                        padding: EdgeInsets.only(left: itemListPlaceTextPadding, bottom: itemListPlaceTextPadding),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                textTitle(),
                                textSubTitle()
                            ]
                        )
                    )
                ]
            )
        );
    }

    Widget textTitle() {
        return Text(
            itemPlaceModel.nama,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                shadows: <Shadow>[
                    Shadow(
                        color: Colors.black,
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 2.0
                    )
                ]
            )
        );
    }

    Widget textSubTitle() {
        return Text(
            itemPlaceModel.lokasi,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                shadows: <Shadow>[
                    Shadow(
                        color: Colors.black,
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 2.0
                    )
                ]
            )
        );
    }

}