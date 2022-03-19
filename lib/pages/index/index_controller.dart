import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/api/home_api.dart';
import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/model/response/home_data_model.dart';

class IndexController extends BaseFutureLoadStateController<HomeDataModel?> {
  HomeDataModel? homeData;

  @override
  Future<HomeDataModel?> loadData({Map? params}) {
    return UserAPI.getProfile().then((value) {
      return HomeAPI.getHomeData(userId: value.id ?? '').then((data) {
        homeData = data.copyWith(user: value);
        return homeData;
      });
    });
  }
}
