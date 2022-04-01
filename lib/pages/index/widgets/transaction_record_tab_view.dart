import 'package:dc_flutter_cli/api/home_api.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/transaction_record_model.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart';

import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TransactionRecordTabViewController
    extends BaseFutureLoadStateController<List<TransactionRecordModel>> {
  List<TransactionRecordModel> transactions = [];

  final int transactionType;
  TransactionRecordTabViewController({required this.transactionType});
  @override
  Future<List<TransactionRecordModel>> loadData({Map? params}) {
    return HomeAPI.getTransactionRecords(sortField: transactionType)
        .then((value) {
      transactions = value;
      return value;
    });
  }

  @override
  void onReady() {
    Get.find<IndexController>().registerRefreshCallback(loadData);
    super.onReady();
  }
}

class TransactionRecordTabView extends HookWidget {
  final int type;
  final ScrollController? scrollController;
  const TransactionRecordTabView(
      {Key? key, required this.type, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Get.lazyPut(
          () => TransactionRecordTabViewController(transactionType: type),
          tag: '$type');
      return null;
    });
    return FutureLoadStateBuilder<TransactionRecordTabViewController>(
      tag: '$type',
      loadingBuilder: (BuildContext context) {
        return Container(
          height: 78,
          child: CupertinoActivityIndicator(),
        );
      },
      builder: (_) {
        return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          controller: scrollController,
          itemBuilder: (BuildContext context, int i) {
            final TransactionRecordModel item = _.transactions[0];
            return DefaultTextStyle(
              style: TextStyle(
                fontSize: 10,
                color: Get.textTheme.labelSmall?.color,
              ),
              child: Container(
                color: i.isOdd
                    ? Get.theme.colorScheme.secondary
                    : Get.theme.colorScheme.tertiary,
                padding: EdgeInsets.all(12),
                child: IntrinsicHeight(
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AppNetWorkImage(
                        '${item.avatar}',
                        height: 54,
                        width: 54,
                      ),
                    ),
                    Gap(24),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${item.nickname}',
                                style: Get.textTheme.labelMedium),
                            Gap(12),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Get.theme.chipTheme.backgroundColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                '${item.settingDay}${AppLocaleKey.day.name.tr}',
                                style: Get.theme.chipTheme.labelStyle,
                              ),
                            ),
                            Gap(12),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Get.theme.chipTheme.backgroundColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                '${item.tradeTimes}${AppLocaleKey.times.name.tr}',
                                style: Get.theme.chipTheme.labelStyle,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${item.status}',
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              '${AppLocaleKey.winRate.name.tr}:',
                            ),
                            Text(
                              ' ${item.winRate}%',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${AppLocaleKey.revenue.name.tr}:',
                            ),
                            Text(
                              '${item.yieldRate}%',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            Text('${AppLocaleKey.retracement.name.tr}:'),
                            Text(
                              '${item.retracementRate}%',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${AppLocaleKey.no.name.tr}'),
                            Text(
                              ' ${item.sorted} ',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            Text('${AppLocaleKey.ranking.name.tr}'),
                            Spacer(),
                            Text(
                              '${AppLocaleKey.profit.name.tr}:'
                                  .trParams({'no': '${item.sorted}'}),
                            ),
                            Text(
                              '${item.totalProfits}',
                              style: TextStyle(
                                fontSize: 13,
                                color: Get.theme.primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
                  ]),
                ),
              ),
            );
          },
          // itemCount: _.transactions.length,
          itemCount: 10,
        );
      },
    );
  }
}
