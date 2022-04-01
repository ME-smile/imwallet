import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/model/response/profit_brief_model.dart';
import 'package:dc_flutter_cli/model/response/user_wallet_model.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AssetsBriefSection extends HookWidget {
  const AssetsBriefSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<ProfitBriefModel?> profit = useState(null);
    final ValueNotifier<UserWalletModel?> wallet = useState(null);
    final ValueNotifier<bool> isBalanceVisbile = useState(false);
    final ValueNotifier<bool> isUstdBalanceVisbile = useState(false);

    Future fetchStatistics() {
      return UserAPI.getStatistics().then((value) {
        profit.value = value;
      });
    }

    Future fetchWalletData() {
      return UserAPI.getWalletData().then((value) {
        wallet.value = value;
      });
    }

    useEffect(() {
      fetchStatistics();
      return null;
    }, []);
    useEffect(() {
      fetchWalletData();
      return null;
    }, []);
    return DefaultTextStyle(
      style: TextStyle(fontSize: 12, height: 2),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Get.theme.colorScheme.secondaryContainer,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('${AppLocaleKey.accumulatedProfit.name.tr}: '),
                          Text(
                            '${profit.value?.totalProfits ?? '0.0000'}U',
                            style: TextStyle(color: Get.theme.primaryColor),
                          ),
                        ],
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Text('${AppLocaleKey.yesterdayProfit.name.tr}:'),
                          Text(
                            '${profit.value?.yestodayProfits ?? '0.0000'}U',
                            style: TextStyle(color: Get.theme.primaryColor),
                          ),
                        ],
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Text('${AppLocaleKey.todayProfit.name.tr}: '),
                          Text(
                            '${profit.value?.todayProfit ?? '0.0000'}U',
                            style: TextStyle(color: Get.theme.primaryColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '钱包余额',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Gap(15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${isUstdBalanceVisbile.value ? (wallet.value?.usdtbalance?.toStringAsFixed(4) ?? '' + 'U') : '******'}',
                              style: Get.textTheme.bodyLarge?.copyWith(
                                  color: Get.theme.primaryColor,
                                  height: 1.2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Gap(6),
                            GestureDetector(
                              onTap: () {
                                isUstdBalanceVisbile.value =
                                    !isUstdBalanceVisbile.value;
                              },
                              child: Image.asset(
                                isUstdBalanceVisbile.value
                                    ? R.icon.eyeOpen
                                    : R.icon.eyeClose,
                              ),
                            )
                          ],
                        ),
                        Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('佣金余额:'),
                            Text(
                              '${isBalanceVisbile.value ? (wallet.value?.balance?.toStringAsFixed(4) ?? '' + 'U') : '******'}',
                              style: Get.textTheme.bodyLarge?.copyWith(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(6),
                            GestureDetector(
                              onTap: () {
                                isBalanceVisbile.value =
                                    !isBalanceVisbile.value;
                              },
                              child: Image.asset(
                                isBalanceVisbile.value
                                    ? R.icon.eyeOpen
                                    : R.icon.eyeClose,
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
          Gap(18),
          Image.asset(
            R.icon.ad,
            height: 80,
            width: double.maxFinite,
            fit: BoxFit.fill,
          ),
          Gap(18),
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Get.theme.colorScheme.secondaryContainer,
            ),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      '${profit.value?.profitsSpot ?? '0.0000'}U',
                      style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '现货收益',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text('第${profit.value?.profitsSpotSort}名')
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      '${profit.value?.totalProfits ?? '0.0000'}U',
                      style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '累计收益',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text('第${profit.value?.profitsSwapSort ?? 0}名')
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      '${profit.value?.profitsMarket ?? '0.0000'}U',
                      style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '市场收益',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text('第${profit.value?.profitsMarketSort ?? 0}名')
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
