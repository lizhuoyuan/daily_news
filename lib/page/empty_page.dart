/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/config/routes.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  EmptyPage({Key key}) : super(key: key);

  @override
  _EmptyPagePageState createState() => _EmptyPagePageState();
}

class _EmptyPagePageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('没有找到页面')),
    );
  }
}
