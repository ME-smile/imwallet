/*
 * @Description: 首页页面ui
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:12:08
 * @LastEditTime: 2021-09-18 15:22:33
 */
import 'package:dc_flutter_cli/model/ui/bottom_navigation_item_model.dart';
import 'package:dc_flutter_cli/pages/follow_up/follow_up_page.dart';
import 'package:dc_flutter_cli/pages/home/drawer/settting_drawer.dart';
import 'package:dc_flutter_cli/pages/index/index_page.dart';
import 'package:dc_flutter_cli/pages/profit/profit_page.dart';
import 'package:dc_flutter_cli/pages/quantification/quantification_page.dart';
import 'package:dc_flutter_cli/pages/strategy/strategy_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:dc_flutter_cli/pages/home/home_controller.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = useState(0);
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        body: IndexedStack(
          index: currentIndex.value,
          children: [
            IndexPage(),
            QuantificationPage(),
            StrategyPage(),
            FollowupPage(),
            ProfitPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            for (BottomNavigationItemModel item in _.bottomNavigationItemModels)
              BottomNavigationBarItem(
                icon: Image.asset(
                  item.icon,
                ),
                label: item.label.tr,
                activeIcon: Image.asset(item.selectedIcon),
              )
          ],
          currentIndex: currentIndex.value,
          onTap: (int i) {
            currentIndex.value = i;
          },
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
