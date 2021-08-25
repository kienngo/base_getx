import 'package:project_import_base_getx/common/utils/uft8_util.dart';
import 'package:project_import_base_getx/data_source/remote/api_helper.dart';
import 'package:project_import_base_getx/data_source/schema/request/home_request.dart';
import 'package:project_import_base_getx/data_source/schema/response/home_response.dart';

abstract class IHomeRepository {
  Future<HomeResponse> getDataHome(HomeRequest requestBody);
}

class HomeRepositoryImpl extends IHomeRepository {
  final ApiHelper _apiHelper;

  HomeRepositoryImpl(this._apiHelper);

  @override
  Future<HomeResponse> getDataHome(HomeRequest requestBody) async {
    // TODO: implement getDataHome
    final data = await _apiHelper.getDataHome(requestBody);
    if (data.status.hasError) {
      return Future.error(data.hasError);
    } else {
      return homeResponseFromJson(data.bodyString!);
    }
  }
}
