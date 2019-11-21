/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/page/empty_page.dart';
import 'package:daily_news/page/home_page.dart';
import 'package:daily_news/page/news_detail_page.dart';
import 'package:daily_news/page/spalsh_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static final String splash = '/';
  static final String home = '/home';
  static final String newsDetail = '/newsDetail';

  static final routes = <String, WidgetBuilder>{
    splash: (_) => SplashPage(),
    home: (_) => HomePage(),
    newsDetail: (_, {arguments}) => NewsDetailPage(news: arguments),
  };

  static Route onGenerateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];

    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
    return MaterialPageRoute(builder: (context) => EmptyPage());
  }
}
