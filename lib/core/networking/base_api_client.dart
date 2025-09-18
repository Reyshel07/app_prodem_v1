import 'package:app_prodem_v1/core/networking/base_api_option.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseApiClient {
  late Dio api;
  late DateTime startedAdd;
  final BaseApiOption baseApiOption = BaseApiOption();
  final String baseUrl = '';

  BaseApiClient(BuildContext? context) {
    _init();
  }

  void _init() {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(minutes: baseApiOption.connectTimeout),
      receiveTimeout: Duration(minutes: baseApiOption.receiveTimeout),
      headers: baseApiOption.headers,
    );
    api = Dio(baseOptions);
  }
}
