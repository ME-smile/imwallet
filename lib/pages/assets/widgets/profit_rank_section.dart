import 'package:date_format/date_format.dart';
import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/components/app_tabbar_view.dart';
import 'package:dc_flutter_cli/model/response/transaction_record_model.dart';
import 'package:dc_flutter_cli/model/ui/profit_rank_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfitRankSection extends HookWidget {
  const ProfitRankSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProfitRankTypeModel> tabs = useMemoized(
        () => [
              ProfitRankTypeModel(title: '现货收益', type: '1'),
              ProfitRankTypeModel(title: '合约收益', type: '2'),
              ProfitRankTypeModel(title: '市场收益', type: '3'),
            ],
        []);
    return Container(
      child: Column(
        children: [
          TabBar(tabs: [
            for (ProfitRankTypeModel item in tabs)
              Tab(
                text: item.title,
              )
          ]),
          AppTabBarView(children: [
            for (ProfitRankTypeModel item in tabs)
              HookBuilder(builder: (BuildContext context) {
                final ValueNotifier<List<TransactionRecordModel>?> list =
                    useState(null);
                useEffect(() {
                  UserAPI.getRankData(type: '${item.type}').then((value) {
                    list.value = value;
                  });
                  return null;
                }, []);
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int i) {
                    final TransactionRecordModel item =
                        (list.value ?? []).elementAt(i);
                    return Container(
                      decoration: BoxDecoration(
                          color: i.isEven
                              ? Get.theme.colorScheme.secondaryContainer
                              : Get.theme.colorScheme.tertiaryContainer),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          AppNetWorkImage(
                            '${item.avatar}',
                            width: 30,
                            height: 30,
                          ),
                          Gap(12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item.nickname}',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Gap(6),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Get.theme.primaryColor,
                                            width: 1,
                                          )),
                                      child: Text(
                                        '${item.gender}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Get.theme.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Gap(5),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Get.theme.primaryColor,
                                            width: 1,
                                          )),
                                      child: Text(
                                        '入驻${item.settingDay}天',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Get.theme.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${item.profitsSwapMonth ?? 0}'),
                              Gap(10),
                              Row(
                                children: [
                                  Text('本月第'),
                                  Text('${item.profitsSwapMonthSort}')
                                ],
                              )
                            ],
                          )),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${item.profitsSwapMonth ?? 0}'),
                              Gap(10),
                              Row(
                                children: [
                                  Text('累计第'),
                                  Text('${item.profitsSwapSort}')
                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                  itemCount: list.value?.length ?? 0,
                );
              })
          ])
        ],
      ),
    );
  }
}
