import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:info_malang_batu_flutter/src/widgets/my_app_bar_text.dart';
import '../data/constants.dart';
import '../data/dimens.dart';
import '../models/list_place/item_place_model.dart';

class ListPlaceDetail extends StatelessWidget {

    const ListPlaceDetail({@required this.itemPlaceModel});

    static const String routeListPlaceDetail = '/detailPlace';
    final ItemPlaceModel itemPlaceModel;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const MyAppBarText(title: 'Detail Lokasi'),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        height: imageDetailHeight,
                        child: CachedNetworkImage(
                            imageUrl: itemPlaceModel.gambar,
                            fit: BoxFit.cover,
                            errorWidget: (BuildContext context, String url, Object error) => Icon(Icons.error),
                            placeholder: (BuildContext context, String url) => Image.asset(placeHolderImage, fit: BoxFit.cover),
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                            itemPlaceModel.deskripsi,
                            style: const TextStyle(
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
