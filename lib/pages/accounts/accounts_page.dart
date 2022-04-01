import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/api_account_model.dart';
import 'package:dc_flutter_cli/pages/accounts/accounts_controller.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountsController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('我的账户'),
        ),
        backgroundColor: Get.theme.colorScheme.secondary,
        body: FutureLoadStateBuilder<AccountsController>(
          builder: (_) {
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
                          Spacer(),
                          GestureDetector(
                              child: Image.asset(R.icon.accountDel)),
                          Gap(12),
                          GestureDetector(
                              child: Image.asset(R.icon.accountEdit)),
                          Gap(12),
                          GestureDetector(
                              child: Image.asset(R.icon.accountAdd)),
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
                                Spacer(),
                                Gap(12),
                                GestureDetector(
                                    child: Image.asset(R.icon.accountDel)),
                                Gap(12),
                                GestureDetector(
                                    child: Image.asset(R.icon.accountAdd)),
                              ],
                            ),
                            Gap(16),
                            Divider(
                              height: 0,
                              thickness: 0,
                            ),
                            Gap(16),
                            for (AccountVOSModel vos
                                in type.accountVOSList ?? []) ...[
                              Row(
                                children: [
                                  Gap(40),
                                  Text(
                                    '${vos.currency}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                      child: Image.asset(R.icon.accountDel)),
                                ],
                              ),
                              Gap(16),
                              if (vos == type.accountVOSList?.last) ...[
                                Divider(
                                  height: 0,
                                  thickness: 0,
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
          },
        ),
      );
    });
  }
}
