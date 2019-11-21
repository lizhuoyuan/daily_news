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
  List<News> _newsList = [];

  List<News> get newsList {
    return _newsList;
  }

  ///[type] 类型
  ///top(头条，默认),shehui(社会),guonei(国内),guoji(国际),yule(娱乐),
  ///tiyu(体育),junshi(军事),keji(科技),caijing(财经),shishang(时尚).
  void fetchNews({String type = ''}) async {
    var response = await Http.get(path: 'index', data: {'type': type});
    BaseResponse baseResponse = BaseResponse.fromJson(response);
    if (baseResponse.errorCode == 0) {
      _newsList.addAll(baseResponse.result.data);
      notifyListeners();
    }
  }
}
