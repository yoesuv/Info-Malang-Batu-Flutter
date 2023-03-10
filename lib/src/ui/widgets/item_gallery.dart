import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/gallery_detail.dart';

class ItemGallery extends StatelessWidget {
  const ItemGallery({super.key, this.itemGalleryModel});

  final ItemGalleryModel? itemGalleryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          GalleryDetail.routeName,
          arguments: itemGalleryModel,
        );
      },
      child: CachedNetworkImage(
        imageUrl: itemGalleryModel?.thumbnail ?? '',
        placeholder: (BuildContext context, String url) =>
            Image.asset(placeHolderImage, fit: BoxFit.cover),
      ),
    );
  }
}
