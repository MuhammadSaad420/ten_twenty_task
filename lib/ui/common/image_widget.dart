import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../core/enums/image_type.dart';
import 'cached_image_widget.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imageSrc,
    required this.type,
    this.imgWidth,
    this.imgHeight,
    this.cache = false,
    this.isSvg = false,
    this.color,
  });

  final String imageSrc;
  final ImageType type;
  final double? imgWidth;
  final double? imgHeight;
  final bool cache;
  final bool isSvg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return type == ImageType.asset
        ? isSvg
            ? SvgPicture.asset(
                imageSrc,
                height: imgHeight,
                width: imgWidth,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              )
            : Image.asset(
                imageSrc,
                width: imgWidth,
                height: imgHeight,
              )
        : cache
            ? CachedImageWidget(
                imgUrl: imageSrc,
                imageWidth: imgWidth,
                imageHeight: imgHeight,
                
              )
            : Image.network(
                imageSrc,
                width: imgWidth,
                height: imgHeight,
                fit: BoxFit.fill,
              );
  }
}
