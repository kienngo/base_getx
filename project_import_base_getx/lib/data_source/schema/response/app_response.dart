import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:project_import_base_getx/data_source/schema/response/app_errors.dart';
import 'package:project_import_base_getx/resource/res_lang.dart';

class AppResponse {
  static T? getResponse<T>(Response<T> response) {
    final status = response.status;

    if (status.connectionError) {
      throw NoConnectionError();
    }

    try {
      final res = jsonDecode(response.bodyString!);

      if (response.isOk) {
        if (res is Map &&
            res['status'] != null &&
            ((res['status'] is bool && !res['status']) ||
                res['status'] is String && res['status'] != 'OK')) {
          if (res['error_message'] != null &&
              res['error_message'].toString().isNotEmpty) {
            throw ApiError(
              message: res['error_message']?.toString() ?? ResLang.unknownError,
            );
          } else {
            throw ApiError(
              message: res['message']?.toString() ?? ResLang.unknownError,
            );
          }
        }

        return response.body;
      } else {
        if (status.isServerError) {
          throw ApiError();
        } else if (status.code == HttpStatus.requestTimeout) {
          throw TimeoutError();
        } else if (response.unauthorized) {
          throw UnauthorizeError(
            message: res['message']?.toString() ?? ResLang.unauthorize,
          );
        } else {
          throw ApiError(
            message: res['message']?.toString() ?? ResLang.unknownError,
          );
        }
      }
    } on FormatException catch (e) {
      throw ApiError(message: e.toString());
    } on TimeoutException catch (e) {
      throw TimeoutError(
        message: e.message?.toString() ?? ResLang.connectionTimeout,
      );
    }
  }
}
