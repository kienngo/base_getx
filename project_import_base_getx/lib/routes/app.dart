import 'package:get/get.dart';
import 'package:project_import_base_getx/features/binding/home_binding.dart';
import 'package:project_import_base_getx/features/page/home_page.dart';
import 'package:project_import_base_getx/routes/routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME_PAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
