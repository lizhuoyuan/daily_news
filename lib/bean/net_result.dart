/*
 * author: Created by 李卓原 on 2019/11/21.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'news.dart';

class BaseResponse {
  String reason;
  int errorCode;
  Result result;

  BaseResponse({
    this.reason,
    this.errorCode,
    this.result,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    errorCode = json['error_code'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    data['error_code'] = this.errorCode;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String stat;
  List<News> data;

  Result({this.stat, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    if (json['data'] != null) {
      data = new List<News>();
      json['data'].forEach((v) {
        data.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['stat'] = this.stat;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
