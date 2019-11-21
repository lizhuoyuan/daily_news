/*
 * author: Created by 李卓原 on 2019/11/14.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/foundation.dart';

class HomePageProvider with ChangeNotifier {
  int _index = 0;

  int get index {
    return _index;
  }

  set(int value) {
    _index = value;
    notifyListeners();
  }
}
