import 'package:get/get.dart';
import 'package:project_import_base_getx/data_source/local/shared_preferences_repo.dart';
import 'package:project_import_base_getx/data_source/schema/request/home_request.dart';
import 'package:project_import_base_getx/data_source/schema/response/app_response.dart';
import 'package:project_import_base_getx/flavor/flavor_config.dart';

class ApiHelper extends GetConnect with AppResponse {
  final SharedPreferencesRepo _sharedPreferencesRepo;

  ApiHelper(this._sharedPreferencesRepo);

  @override
  void onInit() {
    httpClient.baseUrl = FlavorConfig.apiEndPoint;
    httpClient.timeout = Duration(seconds: FlavorConfig.timeOut);

    addRequestModifier();

    httpClient.addResponseModifier((request, response) {
      return response;
    });
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      if (_sharedPreferencesRepo.hasData(_sharedPreferencesRepo.TOKEN_KEY)) {
        request.headers['Authorization'] = _sharedPreferencesRepo.getToken()!;
      }
      request.headers['content-type'] = 'application/json; charset=utf-8';

      return request;
    });
  }

  Future<Response> getDataHome(HomeRequest requestBody) {
    return get('albums/1');
  }
}
