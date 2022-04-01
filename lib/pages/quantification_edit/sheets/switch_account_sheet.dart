import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/api_account_model.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SwitchAccountController
    extends BaseFutureLoadStateController<List<ApiAccountModel>> {
  List<ApiAccountModel> accounts = [];
  @override
  Future<List<ApiAccountModel>> loadData({Map? params}) {
    return UserAPI.getApiAccounts().then((value) {
      accounts = value;
      return value;
    });
  }

  AccountVOSModel? currentVOS = null;

  setCurrentVOS(AccountVOSModel vos) {
    currentVOS = vos;
    update();
  }
}

class SwitchAccountSheet extends GetView<SwitchAccountController> {
  const SwitchAccountSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Center(
            child: Text('切换账号'),
          ),
          preferredSize: Size.fromHeight(18)),
      body: FutureLoadStateBuilder<SwitchAccountController>(builder: (_) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemBuilder: (BuildContext context, int i) {
            final ApiAccountModel item = _.accounts[i];
            return Container(
              // padding: EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: AppNetWorkImage(
                          '${item.photo}',
                          width: 24,
                          height: 24,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Gap(6),
                      Text(
                        '${item.nickname}',
                        style: Get.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Gap(8),
                  for (AccountTypeVOSModel type
                      in item.accountTypeVOSList ?? [])
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Gap(38),
                            Text(
                              '${type.contractName}',
                              style: Get.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Gap(16),
                        Divider(
                          height: 0,
                        ),
                        Gap(16),
                        for (AccountVOSModel vos
                            in type.accountVOSList ?? []) ...[
                          GestureDetector(
                            onTap: () {
                              _.setCurrentVOS(vos);
                            },
                            child: Row(
                              children: [
                                Gap(40),
                                Text(
                                  '${vos.currency}',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Spacer(),
                                Image.asset(_.currentVOS == vos
                                    ? R.icon.checkedRadio
                                    : R.icon.uncheckedRadio)
                              ],
                            ),
                          ),
                          Gap(16),
                          if (vos == type.accountVOSList?.last) ...[
                            Divider(
                              height: 0,
                            ),
                            Gap(16)
                          ]
                        ]
                      ],
                    )
                ],
              ),
            );
          },
          itemCount: _.accounts.length,
        );
      }),
      bottomNavigationBar: Container(
        child: ElevatedButton(
            child: Text('确定切换'),
            onPressed: () => Get.back(result: controller.currentVOS?.id)),
      ),
    );
  }
}
