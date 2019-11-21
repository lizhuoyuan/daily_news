/*
 * author: Created by 李卓原 on 2019/11/14.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/store/home_page_provider.dart';
import 'package:daily_news/store/news_provider.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:provider/provider.dart';

class Store {
  static BuildContext context;
  static BuildContext widgetContext;

  static init({context, child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => NewsProvider()),
        ChangeNotifierProvider(builder: (_) => HomePageProvider()),
      ],
      child: child,
    );
  }

  static T value<T>(context) {
    return Provider.of(context);
  }

  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
