/*
 * author: Created by 李卓原 on 2019/6/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:firebase_admob/firebase_admob.dart';

class Utils {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: false,
    nonPersonalizedAds: false,
  );
}
