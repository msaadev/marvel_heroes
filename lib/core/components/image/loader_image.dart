import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoaderImage extends StatelessWidget {
  const LoaderImage(
      {Key? key,
      required this.link,
      this.fit = BoxFit.cover,
      required this.name,
      this.height,
      this.width})
      : super(key: key);
  final String link,name;
  final BoxFit fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: link + name,
      transitionOnUserGestures: true,
      child: CachedNetworkImage(
        
        imageUrl: link,
        height: height,
        width: width,
        fit: fit,
        placeholder: (_, a) => Container(
          color: Colors.black,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (_, a, s) => const Icon(Icons.error),
      ),
    );
  }
}
