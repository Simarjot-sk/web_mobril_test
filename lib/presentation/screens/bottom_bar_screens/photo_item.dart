import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/photo_dto.dart';
import 'package:web_mobril_test/utils/my_network_image.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.photoDto});

  final PhotoDto photoDto;

  @override
  Widget build(BuildContext context) {
    print(photoDto.url);
    return Card(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MyNetworkImage(
                url: photoDto.url!,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              photoDto.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
