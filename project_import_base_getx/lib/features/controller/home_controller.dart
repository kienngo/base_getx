import 'package:base_getx/core/base_controller.dart';
import 'package:get/get.dart';
import 'package:project_import_base_getx/data_source/repository/home_repository.dart';
import 'package:project_import_base_getx/data_source/schema/request/home_request.dart';
import 'package:project_import_base_getx/data_source/schema/response/home_response.dart';

class HomeController extends BaseController {
  final IHomeRepository _iHomeRepository = Get.find<IHomeRepository>();

  RxString data = new RxString("Home Page");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getDataHome();
  }

  _getDataHome() async {
    HomeRequest homeRequest = new HomeRequest();
    HomeResponse homeResponse = await _iHomeRepository
        .getDataHome(homeRequest);
    print(homeResponse.title);
  }
}
