import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';
import 'package:info_malang_batu_flutter/src/ui/widgets/my_app_bar_text.dart';

class GalleryDetail extends StatelessWidget {
  static const String routeName = '/detailGallery';
  const GalleryDetail({Key? key, this.itemGalleryModel}) : super(key: key);

  final ItemGalleryModel? itemGalleryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const MyAppBarText(title: 'Detail Galeri')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: imageDetailHeight,
            child: CachedNetworkImage(
              imageUrl: itemGalleryModel?.image ?? '',
              fit: BoxFit.cover,
              placeholder: (BuildContext context, String url) =>
                  Image.asset(placeHolderImage, fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              itemGalleryModel?.caption ?? '',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
