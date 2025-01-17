import 'package:get/get.dart';
import 'package:project_import_base_getx/resource/res_lang.dart';

abstract class AppErrors implements Exception {
  String? get message;

  AppErrors() {
    printInfo(info: message!);
  }
}

class ApiError extends AppErrors {
  @override
  final String message;

  ApiError({
    this.message = ResLang.unknownError,
  });
}

class TimeoutError extends AppErrors {
  @override
  final String? message;

  TimeoutError({
    this.message = ResLang.connectionTimeout,
  });
}

class NoConnectionError extends AppErrors {
  @override
  final String message;

  NoConnectionError({
    this.message = ResLang.noConnection,
  });
}

class UnauthorizeError extends AppErrors {
  @override
  final String message;

  UnauthorizeError({
    this.message = ResLang.unauthorize,
  });
}
