/*
 * author: Created by 李卓原 on 2019/11/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:daily_news/config/constant.dart';
import 'package:daily_news/page/empty_page.dart';
import 'package:daily_news/page/news_list_page.dart';
import 'package:daily_news/page/user_center_page.dart';
import 'package:daily_news/store/home_page_provider.dart';
import 'package:daily_news/store/index.dart';
import 'package:daily_news/store/news_provider.dart';
import 'package:daily_news/util/utils.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //tabBarView 的控制器
  PageController _pageController;

  DateTime _lastClickTime;
  InterstitialAd _interstitialAd;

  var _appTabBarTitles = ['新闻', '发现', '我的'];
  var _icons = [Icons.fiber_new, Icons.disc_full, Icons.person];
  var _colors = [Colors.blue, Colors.pink, Colors.green, Colors.red];
  var _pages = [NewsListPage(), EmptyPage(), UserCenterPage()];

  List<BottomNavigationBarItem> _bottomTabs() {
    List<BottomNavigationBarItem> list = [];
    for (int i = 0; i < _appTabBarTitles.length; i++) {
      list.add(BottomNavigationBarItem(
          icon: Icon(_icons[i]),
          title: Text(_appTabBarTitles[i]),
          backgroundColor: _colors[i]));
    }

    return list;
  }

  @override
  void initState() {
    super.initState();
    loadInterstitialAd();

    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Store.value<NewsProvider>(context).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: doubleClickBack,
      child: Scaffold(
        body: PageView(
          children: _pages,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Store.connect<HomePageProvider>(
          builder: (context, HomePageProvider provider, child) {
            return BottomNavigationBar(
              items: _bottomTabs(),
              currentIndex: provider.index,
              onTap: _onTap,
              fixedColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
            );
          },
        ),
      ),
    );
  }

  void _onTap(int value) {
    HomePageProvider provider = Store.value<HomePageProvider>(context);

    if (provider.index != value) {
      _pageController.animateToPage(
        value,
        duration: Duration(milliseconds: 250),
        curve: Curves.ease,
      );
      provider.set(value);
    }
  }

  void loadInterstitialAd() {
    _interstitialAd?.dispose();
    _interstitialAd = createInterstitialAd()
      ..load()
      ..show();
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: adInterstitialId,
      targetingInfo: Utils.targetingInfo,
    );
  }

  Future<bool> doubleClickBack() async {
    if (_lastClickTime == null ||
        DateTime.now().difference(_lastClickTime) > Duration(seconds: 1)) {
      Fluttertoast.showToast(msg: '连续双击退出');
      _lastClickTime = DateTime.now();
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }
}
