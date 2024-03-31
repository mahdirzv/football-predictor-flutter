
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BaseController<T extends DataModel>
    extends FullLifeCycleController with StateMixin<T> {
  T? data;

  var logger = Logger();

  loadData() async {
    change(data, status: RxStatus.loading());
  }

  Future<void> handleData(Response? response,
      T Function(Map<String, dynamic> data) factory, Function(T) work,
      {bool ignoreResponseCode = false}) async {
    logger.d(response?.bodyString);
    if (response?.statusCode == 200) {
      T? obj;
      try {
        Map<String, dynamic> json =
            await jsonDecode(response?.bodyString ?? "");
        obj = factory(json);
      } on Exception catch (e) {
        debugPrint('Exception details:\n $e');
      } catch (e, s) {
        debugPrint('Exception details:\n $e');
        debugPrint('Stack trace:\n $s');
      }

      if (obj?.code == ResponseCode.eSuccess || ignoreResponseCode) {
        data = obj;
        work(obj!);
      } else {
        change(data,
            status: RxStatus.error(obj?.message ?? "something_went_wrong".tr));
      }
    } else {
      change(data, status: RxStatus.error("something_went_wrong".tr));
    }
  }
}

class DataModel {
  DataModel({this.code, this.message});

  ResponseCode? code;
  String? message;
}

enum ResponseCode {
  eSuccess(0),
  eError(1);

  /* Helper factory allows us to default to error general when parsing json */
  factory ResponseCode.fromJson(Map<String, dynamic> json) {
    var ret = ResponseCode.values
        .firstWhereOrNull((element) => element.value == json["code"]);

    ret ??= ResponseCode.values
        .firstWhereOrNull((element) => element.value == json["responseCode"]);
    ret ??= ResponseCode.eError;

    return ret;
  }

  const ResponseCode(this.value);
  final int value;
}