/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/bean/news.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  final News news;

  NewsDetailPage({
    Key key,
    @required this.news,
  }) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isInitialLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${'每日新闻'}'),
      ),
      body: Stack(
        children: <Widget>[
          if (!isInitialLoaded) Center(child: CircularProgressIndicator()),
          Opacity(
            opacity: isInitialLoaded ? 1 : 0,
            child: WebView(
              initialUrl: widget.news?.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (String url) {
                setState(() {
                  isInitialLoaded = true;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
