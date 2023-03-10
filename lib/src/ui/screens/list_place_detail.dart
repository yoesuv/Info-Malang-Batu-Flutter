import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class ListPlaceDetail extends StatelessWidget {
  static const String routeName = '/detailPlace';
  const ListPlaceDetail({super.key, this.itemPlaceModel});

  final ItemPlaceModel? itemPlaceModel;

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
              imageUrl: itemPlaceModel?.gambar ?? '',
              fit: BoxFit.cover,
              placeholder: (BuildContext context, String url) =>
                  Image.asset(placeHolderImage, fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              itemPlaceModel?.nama ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              itemPlaceModel?.deskripsi ?? '',
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
