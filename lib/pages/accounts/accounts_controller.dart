import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/api_account_model.dart';

class AccountsController
    extends BaseFutureLoadStateController<List<ApiAccountModel>> {
  List<ApiAccountModel> accounts = [];
  @override
  Future<List<ApiAccountModel>> loadData({Map? params}) {
    return UserAPI.getApiAccounts().then((value) {
      accounts = value;
      return value;
    });
  }
}
