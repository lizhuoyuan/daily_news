/*
 * author: Created by 李卓原 on 2019/11/21.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/config/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CachedImage extends StatelessWidget {
  final image;
  final placeholder;
  final double width;
  final double height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final imageScale;

  CachedImage({
    Key key,
    this.placeholder,
    @required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.alignment = Alignment.center,
    this.imageScale = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: placeholder ?? Images.logo,
      image: image,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      imageScale: imageScale,
    );
  }
}
