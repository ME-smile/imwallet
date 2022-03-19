/*
 * @Description: 首页逻辑
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:18:30
 * @LastEditTime: 2021-09-18 15:18:30
 */
import 'package:dc_flutter_cli/model/ui/bottom_navigation_item_model.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<BottomNavigationItemModel> bottomNavigationItemModels = [
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
  ];
}
