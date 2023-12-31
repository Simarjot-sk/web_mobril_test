import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage.circular({super.key, required this.url})
      : isCircular = true;

  const MyNetworkImage({Key? key, required this.url, this.isCircular = false})
      : super(key: key);

  final String url;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (_, __, ___) => const Icon(Icons.image),
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: Shimmer.fromColors(
            baseColor: const Color(0xffc0c0c0),
            highlightColor: Colors.grey[300]!,
            enabled: true,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
