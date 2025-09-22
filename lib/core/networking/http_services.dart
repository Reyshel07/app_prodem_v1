import 'package:app_prodem_v1/core/networking/base_api_client.dart';
import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/core/networking/base_api_option.dart';
import 'package:app_prodem_v1/core/networking/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  get baseUrl => dotenv.env['BASE_URL']!;

  @override
  get customBaseOptions {
    return BaseApiOption(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
  }

  @override
  get interceptors => {InterceptorService: InterceptorService(api)};

  Future<dynamic> get(
    String path, {
    required String operationName,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await network(
      request: (request) => request.get(path, queryParameters: queryParameters),
      handleSuccess: (startedAt, response) async {
        return await _handleSuccess(
          startedAt: startedAt,
          response: response,
          operationName: operationName,
        );
      },
    );

    return response;
  }

  Future<dynamic> post(
    String path, {
    required String operationName,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    final response = await network(
      request: (request) => request.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      ),
      handleSuccess: (startedAt, response) async {
        return await _handleSuccess(
          startedAt: startedAt,
          response: response,
          operationName: operationName,
        );
      },
    );

    return response;
  }

  Future<dynamic> postFormData(
    String path, {
    required String operationName,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    List<Map<String, dynamic>>? files,
    Map<String, List<Map<String, dynamic>>>? fileGroups,
  }) async {
    final formData = FormData.fromMap({
      ...data,
      ...?files?.asMap().map(
        (i, file) => MapEntry(
          file['name'],
          MultipartFile.fromFileSync(
            file['path'],
            filename: file['filename'],
            contentType: file['contentType'],
          ),
        ),
      ),
      ...?fileGroups?.map(
        (key, files) => MapEntry(
          key,
          files.map((file) {
            return MultipartFile.fromFileSync(
              file['path'],
              filename: file['filename'],
              contentType: file['contentType'],
            );
          }).toList(),
        ),
      ),
    });

    final response = await network(
      request: (request) =>
          request.post(path, data: formData, queryParameters: queryParameters),
      handleSuccess: (startedAt, response) async {
        return await _handleSuccess(
          startedAt: startedAt,
          response: response,
          operationName: operationName,
        );
      },
    );

    return response;
  }

  Future<dynamic> patchFormData(
    String path, {
    required String operationName,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    List<Map<String, dynamic>>? files,
    Options? options,
  }) async {
    final formData = FormData.fromMap({
      ...?data,
      ...?files?.asMap().map(
        (i, file) => MapEntry(
          file['name'],
          MultipartFile.fromFileSync(
            file['path'],
            filename: file['filename'],
            contentType: file['contentType'],
          ),
        ),
      ),
    });

    final response = await network(
      request: (request) => request.patch(
        path,
        data: formData,
        queryParameters: queryParameters,
        options: options,
      ),
      handleSuccess: (startedAt, response) async {
        return await _handleSuccess(
          startedAt: startedAt,
          response: response,
          operationName: operationName,
        );
      },
    );

    return response;
  }

  Future<dynamic> patch(
    String path, {
    required String operationName,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await network(
      request: (request) => request.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      ),
      handleSuccess: (startedAt, response) async {
        return await _handleSuccess(
          startedAt: startedAt,
          response: response,
          operationName: operationName,
        );
      },
    );

    return response;
  }

  Future<dynamic> put(
    String path, {
    required String operationName,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await network(
      request: (request) =>
          request.put(path, data: data, queryParameters: queryParameters),
      handleSuccess: (startedAt, response) async {
        return await _handleSuccess(
          startedAt: startedAt,
          response: response,
          operationName: operationName,
        );
      },
    );

    return response;
  }

  Future<dynamic> delete(
    String path, {
    required String operationName,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await network(
      request: (request) =>
          request.delete(path, data: data, queryParameters: queryParameters),
      handleSuccess: (startedAt, response) async {
        return await _handleSuccess(
          startedAt: startedAt,
          response: response,
          operationName: operationName,
        );
      },
    );

    return response;
  }

  _handleSuccess({
    required DateTime startedAt,
    required Response response,
    required String operationName,
  }) async {
    if (response.data is Map<String, dynamic>) {
      final state = response.data['state'];
      final message = response.data['message'];
      final successStates = [0, 1, 200];
      if (!successStates.contains(state)) {
        throw BaseApiException(
          key: response.data['key'] ?? DioExceptionKey.apiLogicError,
          message: message ?? 'Ha ocurrido un error inesperado.',
        );
      }
    }

    return response.data;
  }

  @override
  BaseApiException handleResponseType(DioException error) {
    late String key;
    late String message;

    if (error.response?.statusCode == 401) {
      return BaseApiException(
        key: DioExceptionKey.unauthorized,
        message: 'Sesión expirada',
      );
    }

    if (error.response != null && error.response!.data is Map) {
      key = error.response!.data['error_key'] ?? DioExceptionKey.unexpected;

      if (error.response!.data['message'] is List) {
        message = error.response!.data['message'].join(', ');
      } else if (error.response!.data['message'] is Map) {
        message = error.response!.data['message']['message'];
      } else {
        message = error.response!.data['message'] ?? 'Error inesperado';
      }
    } else {
      key = DioExceptionKey.unexpected;
      message = 'Error inesperado';
    }

    return BaseApiException(key: key, message: message);
  }
}
