import 'package:dc_flutter_cli/api/home_api.dart';
import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/model/response/profit_brief_model.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfitSection extends HookWidget {
  const ProfitSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<ProfitBriefModel?> profit = useState(null);
    Future fetch() {
      return UserAPI.getStatistics().then((value) {
        profit.value = value;
      });
    }

    useEffect(() {
      fetch();
      Get.find<IndexController>().registerRefreshCallback(fetch);
      return null;
    }, []);
    return DefaultTextStyle(
      style: TextStyle(
        color: Get.theme.primaryColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${profit.value?.todayProfit ?? '0.0000'}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Gap(12),
                  Text(
                    '${AppLocaleKey.todayProfit.name.tr}',
                    style: Get.textTheme.bodySmall,
                  ),
                  Gap(18),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      minWidth: 88,
                    ),
                    decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      '${AppLocaleKey.trade.name.tr}${profit.value?.tradeTimes ?? '0'}${AppLocaleKey.times.name.tr}',
                      style: Get.textTheme.labelSmall,
                    ),
                  ),
                  Gap(18),
                  Text(
                    '${profit.value?.yieldRate ?? '0.00'}%',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Gap(12),
                  Text(
                    '${AppLocaleKey.revenue.name.tr}',
                    style: Get.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Gap(24),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${profit.value?.totalProfits ?? '0.0000'}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Gap(12),
                  Text(
                    '${AppLocaleKey.accumulatedProfit.name.tr}',
                    style: Get.textTheme.bodySmall,
                  ),
                  Gap(18),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      minWidth: 88,
                    ),
                    decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      '${AppLocaleKey.retracement.name.tr}${profit.value?.retracementRate ?? '0.00'}%',
                      style: Get.textTheme.labelSmall,
                    ),
                  ),
                  Gap(18),
                  Text(
                    '${profit.value?.walletBalance ?? '0.0000'}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Gap(12),
                  Text(
                    '${AppLocaleKey.wallet.name.tr}',
                    style: Get.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Gap(24),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${profit.value?.yestodayProfits ?? '0.0000'}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Gap(12),
                  Text(
                    '${AppLocaleKey.yesterdayProfit.name.tr}',
                    style: Get.textTheme.bodySmall,
                  ),
                  Gap(18),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      minWidth: 88,
                    ),
                    decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      '${profit.value?.status}',
                      style: Get.textTheme.labelSmall,
                    ),
                  ),
                  Gap(18),
                  Text(
                    '${profit.value?.winRate ?? '0.00'}%',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Gap(12),
                  Text(
                    '${AppLocaleKey.winRate.name.tr}',
                    style: Get.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
