import 'package:dc_flutter_cli/api/quantification_api.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/ui/quantification_model.dart';

class QuantificationController
    extends BaseFutureLoadStateController<List<QuantificationModel>> {
  List<QuantificationModel> quantifications = [];
  @override
  Future<List<QuantificationModel>> loadData({Map? params}) {
    return QuantificaionAPI.getQuantifications(
            quantType: QuantificaionType.sellerApi)
        .then((value) {
      quantifications = value;
      return value;
    });
  }
}
