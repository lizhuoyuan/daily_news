/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/config/constant.dart';
import 'package:daily_news/config/text_styles.dart';
import 'package:daily_news/page/news_list_page.dart';
import 'package:daily_news/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class NewsAllPage extends StatefulWidget {
  NewsAllPage({Key key}) : super(key: key);

  @override
  _NewsAllPageState createState() => _NewsAllPageState();
}

class _NewsAllPageState extends State<NewsAllPage>
    with AutomaticKeepAliveClientMixin {
  final List<Tab> tabBars = [];
  final List<Widget> tabPages = [];

  @override
  void initState() {
    super.initState();
    types.forEach((key, v) => {
          tabBars.add(Tab(
              child: Text(
            '$v',
            style: TextStyles.tabStyle,
          ))),
          tabPages.add(NewsListPage(key: ObjectKey(key), type: key))
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      child: Scaffold(
        appBar: MyAppBar(
          showBackButton: false,
          title: TabBar(
            tabs: tabBars,
            isScrollable: true,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: TabBarView(
          children: tabPages,
        ),
      ),
      length: tabBars.length,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
