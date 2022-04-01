import 'package:dc_flutter_cli/api/quantification_api.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/api_account_model.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/sheets/switch_account_sheet.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchCurrencyController
    extends BaseFutureLoadStateController<List<String>> {
  List<String> currencyList = [];
  String? currency = null;
  @override
  Future<List<String>> loadData({Map? params}) {
    final SwitchAccountController accountController =
        Get.find<SwitchAccountController>();

    final AccountVOSModel? vos = accountController.currentVOS;

    return QuantificaionAPI.getCurrencyList(
            contract: vos?.contract, currency: vos?.currency)
        .then((value) {
      currencyList = value.cast<String>();
      return value.cast<String>();
    });
  }

  void setCurrency(String cur) {
    currency = cur;
    update();
  }
}

class SwitchCurrencySheet extends GetView<SwitchCurrencyController> {
  const SwitchCurrencySheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Center(
            child: Text('选择币对'),
          ),
          preferredSize: Size.fromHeight(18)),
      body: FutureLoadStateBuilder<SwitchCurrencyController>(builder: (_) {
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int i) => Divider(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemBuilder: (BuildContext context, int i) {
            final String item = _.currencyList[i];
            return GestureDetector(
              onTap: () {
                _.setCurrency(item);
              },
              child: Row(
                children: [
                  Image.asset(item == _.currency
                      ? R.icon.checkedRadio
                      : R.icon.uncheckedRadio),
                  Text('$item'),
                ],
              ),
            );
          },
          itemCount: _.currencyList.length,
        );
      }),
      bottomNavigationBar: Container(
        child: ElevatedButton(
            child: Text('确定切换'),
            onPressed: () => Get.back(result: controller.currency)),
      ),
    );
  }
}
