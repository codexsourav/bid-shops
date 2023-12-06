import 'package:bid_and_shops/Components/simmer/ShowSimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String? imageUrl;
  final BoxFit? fit;

  const ImageLoader(
      {super.key,
      this.height = 50,
      this.width = 50,
      this.imageUrl,
      this.fit,
      this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: imageUrl ??
            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return ShowShimmer(
            width: width,
            height: height,
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            width: width,
            height: height,
            color: Colors.red,
            child: Icon(
              Icons.info,
              color: Colors.white,
              size: (width / 2),
            ),
          );
        },
      ),
    );
  }
}
