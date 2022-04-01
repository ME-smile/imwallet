import 'package:dc_flutter_cli/components/app_modal.dart';
import 'package:dc_flutter_cli/model/response/api_account_model.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/quantification_edit_controller.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/sheets/switch_account_sheet.dart';
import 'package:dc_flutter_cli/res/max_money_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantificaionEditController>(builder: (_) {
      return GestureDetector(
        onTap: () {
          showAppModalPopup<String>(
            maxHeight: Get.height * .84,
            context: context,
            builder: (BuildContext context) {
              return SwitchAccountSheet();
            },
          ).then((value) {
            if (value == null) return;
            _.setCurrentVOS(value);
          });
        },
        child: Container(
            height: 76,
            padding: EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MaxMoneyColor.onSurface,
            ),
            child: _.currentVOS == null
                ? Text('请选择账户')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('账户权益'),
                          Text('${_.currentVOS?.accountRights}'),
                          Text('${_.currentVOS?.currency}'),
                        ],
                      ),
                      Text('${_.currentVOS?.contractCn}')
                    ],
                  )),
      );
    });
  }
}
