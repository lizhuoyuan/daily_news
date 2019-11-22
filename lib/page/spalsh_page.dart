/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/config/images.dart';
import 'package:daily_news/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      goHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1080, height: 1920, allowFontScaling: true)
          ..init(context);

    return GestureDetector(
      child: Image.asset(
        Images.splashBackground,
        fit: BoxFit.fill,
      ),
      onTap: goHome,
    );
  }

  void goHome() {
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  void dispose() {
    super.dispose();
    //_interstitialAd?.dispose();
  }
}
