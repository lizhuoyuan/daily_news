/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';

class UserCenterPage extends StatefulWidget {
  UserCenterPage({Key key}) : super(key: key);

  @override
  _EmptyPagePageState createState() => _EmptyPagePageState();
}

class _EmptyPagePageState extends State<UserCenterPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(child: Text('个人中心')),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
