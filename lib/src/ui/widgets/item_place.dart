import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/models/list_place/item_place_model.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/list_place_detail.dart';

class ItemPlace extends StatelessWidget {
  const ItemPlace({super.key, this.itemPlaceModel});

  final ItemPlaceModel? itemPlaceModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ListPlaceDetail.routeName,
          arguments: itemPlaceModel,
        );
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: itemListPlaceHeight,
            child: CachedNetworkImage(
              imageUrl: itemPlaceModel?.gambar ?? '',
              fit: BoxFit.cover,
              placeholder: (BuildContext context, String url) =>
                  Image.asset(placeHolderImage, fit: BoxFit.cover),
              errorWidget: (BuildContext context, String url, Object? error) =>
                  const Icon(Icons.error),
            ),
          ),
          Container(
            width: double.infinity,
            height: itemListPlaceHeight,
            padding: EdgeInsets.only(
              left: itemListPlaceTextPadding,
              bottom: itemListPlaceTextPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[textTitle(), textSubTitle()],
            ),
          ),
        ],
      ),
    );
  }

  Widget textTitle() {
    return Text(
      itemPlaceModel?.nama ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        shadows: <Shadow>[
          Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 2),
        ],
      ),
    );
  }

  Widget textSubTitle() {
    return Text(
      itemPlaceModel?.lokasi ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        shadows: <Shadow>[
          Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 2),
        ],
      ),
    );
  }
}
