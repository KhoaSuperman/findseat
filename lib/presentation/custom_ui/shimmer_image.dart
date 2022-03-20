import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  String url;
  BoxFit fit;
  double? width;
  double? height;
  double? aspectRatio;
  double iconHolderSize;

  ShimmerImage(
    this.url, {
    required this.fit,
    this.width,
    this.height,
    this.aspectRatio,
    this.iconHolderSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: this.aspectRatio != null
              ? AspectRatio(
                  aspectRatio: aspectRatio!,
                  child: Container(
                    child: _buildIcon(),
                  ),
                )
              : Container(
                  width: this.width,
                  height: this.height,
                  child: _buildIcon(),
                ),
        ),
        this.aspectRatio != null
            ? AspectRatio(
                aspectRatio: aspectRatio!,
                child: Image.network(
                  url,
                  fit: fit,
                ),
              )
            : Image.network(
                url,
                width: this.width,
                height: this.height,
                fit: fit,
              ),
      ],
    );
  }

  _buildIcon() {
    return Center(
      child: Icon(
        Icons.crop_original,
        color: Colors.red,
        size: iconHolderSize,
      ),
    );
  }
}
