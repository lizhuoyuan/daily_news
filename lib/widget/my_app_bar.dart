/*
 * author: Created by 李卓原 on 2018/11/26.
 * email: zhuoyuan93@gmail.com
 * AppBar
 */

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final PreferredSizeWidget bottom;
  final List<Widget> actions;
  final double myToolBarHeight = 45;
  final showBackButton;
  final double elevation;
  final textStyle;
  final backgroundColor;

  MyAppBar({
    Key key,
    this.title,
    this.bottom,
    this.actions,
    this.showBackButton = true,
    this.textStyle,
    this.elevation = 2,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      title: (title.runtimeType.toString() == 'String')
          ? Text(
              '$title',
              style: textStyle,
            )
          : title,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
          : null,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(myToolBarHeight + (bottom?.preferredSize?.height ?? 0.0));
}
