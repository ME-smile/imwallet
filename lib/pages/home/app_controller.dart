import 'package:dc_flutter_cli/api/app_api.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';

class AppController extends BaseFutureLoadStateController {
  @override
  Future loadData({Map? params}) {
    return AppAPI.checkAppVersion().then((value) {
      print(value);
      print('----------');
    }).catchError((err, s) {
      print(err);
      print(s);
    });
  }
}
