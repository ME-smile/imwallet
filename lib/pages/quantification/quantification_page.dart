import 'package:dc_flutter_cli/api/quantification_api.dart';
import 'package:dc_flutter_cli/components/app_expansion_tile.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/contract_model.dart';
import 'package:dc_flutter_cli/model/response/contract_quantificaion_plan_model.dart';
import 'package:dc_flutter_cli/model/ui/quantification_model.dart';
import 'package:dc_flutter_cli/pages/quantification/queatification_controller.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class QuantificationPage extends StatelessWidget {
  const QuantificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantificationController>(builder: (_) {
      print(_);
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(R.icon.quantificaionFilter),
            onPressed: () {},
          ),
          title: Text(AppLocaleKey.myQuantification.name.tr),
          actions: [
            IconButton(
              icon: Image.asset(R.icon.quantificaionAdd),
              onPressed: () {
                Get.toNamed(AppRoutes.quantificaionEdit);
              },
            ),
          ],
        ),
        body: FutureLoadStateBuilder<QuantificationController>(builder: (_) {
          return DefaultTextStyle(
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontSize: 13,
            ),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int i) {
                return Divider(
                  height: 12,
                  thickness: 0,
                );
              },
              itemBuilder: (BuildContext context, int i) {
                final QuantificationModel item = _.quantifications[0];
                return HookBuilder(builder: (context) {
                  final ValueNotifier<List<SellerAccountModel>?> accounts =
                      useState(null);
                  return AppExpansionTile(
                    headerBackgroundColor: Color(0xFF243133),
                    backgroundColor: Color(0xFF243133),
                    headerPadding: EdgeInsets.symmetric(
                      // vertical: 14,
                      horizontal: 12,
                    ),
                    leading: Expanded(
                        child: Row(
                      children: [
                        AppNetWorkImage(
                          '${item.avatar}',
                          width: 24,
                          height: 24,
                        ),
                        Gap(8),
                        Text('${item.house}'),
                        Gap(6),
                        Text('${item.nickname}'),
                      ],
                    )),
                    content: HookBuilder(
                      builder: (BuildContext context) {
                        useEffect(() {
                          if (accounts.value != null) return;
                          QuantificaionAPI.getSellerAccounts(
                                  quantType: QuantificaionType.sellerApi,
                                  userAPiId: '${item.userApiId}')
                              .then((value) {
                            accounts.value = value;
                          });
                          return null;
                        }, []);
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int i) {
                            final SellerAccountModel account =
                                (accounts.value ?? <SellerAccountModel>[])[i];
                            return HookBuilder(builder: (context) {
                              final ValueNotifier<
                                      List<ContractQuantificationPlanModel>?>
                                  plans = useState(null);
                              return AppExpansionTile(
                                headerHeight: 44,
                                headerPadding: EdgeInsets.symmetric(
                                  // vertical: 14,
                                  horizontal: 12,
                                ),
                                leading: Expanded(
                                    child: Row(
                                  children: [
                                    Text('${account.currency}'),
                                    Gap(12),
                                    Text('${account.contractName}'),
                                  ],
                                )),
                                headerTrailing: Icon(Icons.keyboard_arrow_down),
                                content: HookBuilder(
                                    builder: (BuildContext context) {
                                  useEffect(() {
                                    if (plans.value != null) return;
                                    QuantificaionAPI
                                            .getContractQuantificationPlans(
                                                currency: '${account.currency}',
                                                userAPiId:
                                                    '${account.userApiId}')
                                        .then((value) {
                                      plans.value = value;
                                    });
                                    return null;
                                  }, []);
                                  return Container(
                                    child: Text('1'),
                                  );
                                }),
                              );
                            });
                          },
                          itemCount: accounts.value?.length ?? 0,
                        );
                      },
                    ),
                  );
                });
              },
              itemCount: 10,
            ),
          );
        }),
      );
    });
  }
}
