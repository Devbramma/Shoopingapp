import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  static Widget cachedNetworkImage({required String imageUrl}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Image.asset('assets/images/loader.webp'),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
