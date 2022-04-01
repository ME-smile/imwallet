/*
 * @Description: 首页页面ui
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:12:08
 * @LastEditTime: 2021-09-18 15:22:33
 */
import 'package:dc_flutter_cli/model/ui/bottom_navigation_item_model.dart';
import 'package:dc_flutter_cli/pages/accounts/accounts_page.dart';
import 'package:dc_flutter_cli/pages/assets/assets_page.dart';
import 'package:dc_flutter_cli/pages/home/drawer/setting_drawer.dart';
import 'package:dc_flutter_cli/pages/home/home_controller.dart';
import 'package:dc_flutter_cli/pages/index/index_page.dart';
import 'package:dc_flutter_cli/pages/quantification/quantification_page.dart';
import 'package:dc_flutter_cli/pages/strategy/strategy_page.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = useState(0);

    final List<BottomNavigationItemModel> bottomNavigationItemModels =
        useMemoized(() => [
              BottomNavigationItemModel(
                icon: R.icon.home,
                selectedIcon: R.icon.homeSelected,
                label: AppLocaleKey.home.name,
              ),
              BottomNavigationItemModel(
                icon: R.icon.quantification,
                selectedIcon: R.icon.quantificationSelected,
                label: AppLocaleKey.quantification.name,
              ),
              BottomNavigationItemModel(
                icon: R.icon.follow,
                selectedIcon: R.icon.followSelected,
                label: AppLocaleKey.follow.name,
              ),
              BottomNavigationItemModel(
                icon: R.icon.strategy,
                selectedIcon: R.icon.strategySelected,
                label: AppLocaleKey.strategy.name,
              ),
              BottomNavigationItemModel(
                icon: R.icon.profit,
                selectedIcon: R.icon.profitSelected,
                label: AppLocaleKey.profit.name,
              ),
            ]);
    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        Get.find<HomeController>()
            .setOpenDrawerHandler(Scaffold.of(context).openDrawer);
      });
      return null;
    }, []);
    return Scaffold(
      drawer: SettingDrawer(),
      body: IndexedStack(
        index: currentIndex.value,
        children: [
          IndexPage(),
          QuantificationPage(),
          StrategyPage(),
          // FollowupPage(),
          AssetsPage(),
          // ProfitPage(),
          AccountsPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (BottomNavigationItemModel item in bottomNavigationItemModels)
            BottomNavigationBarItem(
              icon: Image.asset(
                item.icon,
              ),
              label: item.label.tr,
              activeIcon: Image.asset(
                item.selectedIcon,
                color: Get.theme.primaryColor,
              ),
            )
        ],
        currentIndex: currentIndex.value,
        onTap: (int i) {
          currentIndex.value = i;
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
