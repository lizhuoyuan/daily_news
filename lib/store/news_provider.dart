/*
 * author: Created by 李卓原 on 2019/11/14.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/bean/net_result.dart';
import 'package:daily_news/bean/news.dart';
import 'package:daily_news/util/http_util.dart';
import 'package:flutter/foundation.dart';

class NewsProvider with ChangeNotifier {
  Map<String, List<News>> _newsMap = {};

  List<News> newsList({String type = 'top'}) {
    return _newsMap[type] ?? [];
  }

  ///[type] 类型 新闻来源
  void fetchNews({String type = 'top'}) async {
    var response = await Http.get(path: 'index', data: {'type': type});
    BaseResponse baseResponse = BaseResponse.fromJson(response);
    if (baseResponse.errorCode == 0) {
      _newsMap[type] = baseResponse.result.data;
      notifyListeners();
    }
  }

  void loadMoreNews({String type = 'top'}) async {
    var response = await Http.get(path: 'index', data: {'type': type});
    BaseResponse baseResponse = BaseResponse.fromJson(response);
    if (baseResponse.errorCode == 0) {
      List<News> list = _newsMap[type];
      list.addAll(baseResponse.result.data);
      _newsMap.putIfAbsent(type, () => list);
      notifyListeners();
    }
  }
}
