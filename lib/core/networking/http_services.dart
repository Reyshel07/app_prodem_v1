import 'package:app_prodem_v1/core/networking/base_api_client.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient extends BaseApiClient {
  late final int connectTimeout;
  late final int receiveTimeout;

  ApiClient({
    BuildContext? context,
    this.connectTimeout = 60000,
    this.receiveTimeout = 60000,
  }) : super(context);

  @override
  get baseUrl => dotenv.env['BASEURL']!;
}
