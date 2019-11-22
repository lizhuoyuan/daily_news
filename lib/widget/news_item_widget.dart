/*
 * author: Created by 李卓原 on 2019/11/21.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'dart:math';

import 'package:daily_news/bean/news.dart';
import 'package:daily_news/config/text_styles.dart';
import 'package:daily_news/widget/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsItemWidget extends StatelessWidget {
  final News news;
  final Function onTap;

  NewsItemWidget({this.news,this.onTap});

  @override
  Widget build(BuildContext context) {
    int size = 1;
    if (news.thumbnailPicS03 != null) {
      size = 3;
    } else if (news.thumbnailPicS02 != null) {
      size = 2;
    }
    final imageWidth = ScreenUtil.screenWidthDp / size - 20 + 5 * (size - 1);
    final height = imageWidth * 2 / 3;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${news.title}',
              style: TextStyles.titleStyle,
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CachedImage(
                  image: news.thumbnailPicS,
                  width: imageWidth,
                  height: height,
                ),
                size > 1
                    ? CachedImage(
                        image: news.thumbnailPicS02,
                        width: imageWidth,
                        height: height,
                      )
                    : SizedBox(),
                size > 2
                    ? CachedImage(
                        image: news.thumbnailPicS03,
                        width: imageWidth,
                        height: height,
                      )
                    : SizedBox(),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${news.authorName}',
                  style: TextStyles.mainStyle,
                ),
                SizedBox(width: 5),
                Text(
                  '${news.date}',
                  style: TextStyles.mainStyle,
                ),
              ],
            ),
            SizedBox(height: 2),
            Divider(),
          ],
        ),
      ),
    );
  }
}
