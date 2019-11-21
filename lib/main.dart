import 'package:daily_news/config/constant.dart';
import 'package:daily_news/config/routes.dart';
import 'package:daily_news/store/index.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: adAppId);
  }

  @override
  Widget build(BuildContext context) {
    return Store.init(
        context: context,
        child: MaterialApp(
          title: 'Daily News',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: Routes.splash,
          onGenerateRoute: Routes.onGenerateRoute,
        ));
  }
}
