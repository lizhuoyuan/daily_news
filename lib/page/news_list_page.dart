/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/bean/news.dart';
import 'package:daily_news/config/routes.dart';
import 'package:daily_news/store/index.dart';
import 'package:daily_news/store/news_provider.dart';
import 'package:daily_news/widget/news_item_widget.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatefulWidget {
  final String type;

  NewsListPage({Key key, this.type = 'top'}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Store.value<NewsProvider>(context).fetchNews(type: widget.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Store.connect<NewsProvider>(
          builder: (BuildContext context, NewsProvider provider, child) {
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: provider.newsList(type: widget.type).length,
          ),
        );
      }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    News news =
        Store.value<NewsProvider>(context).newsList(type: widget.type)[index];

    return NewsItemWidget(
      onTap: () {
        Navigator.pushNamed(context, Routes.newsDetail, arguments: news);
      },
      news: news,
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<Null> _onRefresh() async {
    Store.value<NewsProvider>(context).fetchNews(type: widget.type);
  }
}
