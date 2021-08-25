import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_import_base_getx/data_source/local/shared_preferences_repo.dart';
import 'package:project_import_base_getx/data_source/remote/api_helper.dart';
import 'package:project_import_base_getx/data_source/repository/home_repository.dart';
import 'package:project_import_base_getx/features/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SharedPreferencesRepo());
    Get.lazyPut(() => ApiHelper(Get.find()));
    Get.lazyPut<IHomeRepository>(() => HomeRepositoryImpl(Get.find()));
    Get.lazyPut(() => HomeController());
  }
}
