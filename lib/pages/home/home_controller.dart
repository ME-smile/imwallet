/*
 * @Description: 首页逻辑
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:18:30
 * @LastEditTime: 2021-09-18 15:18:30
 */
import 'package:dc_flutter_cli/storage/sp_util.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String? projectName = null;
  String? projectLogo = null;
  Function()? openDrawer;
  @override
  void onReady() {
    super.onReady();
    initProjectInfo();
  }

  void saveProjectInfo(
      {required String? projectName, required String? projectLogo}) {
    SpUtil.setString(SpKey.projectLogo, projectLogo ?? '');
    SpUtil.setString(SpKey.projectName, projectName ?? '');
    this.projectLogo = projectLogo;
    this.projectName = projectName;
    update(['project']);
  }

  void initProjectInfo() {
    projectLogo = SpUtil.getString(SpKey.projectLogo);
    projectName = SpUtil.getString(SpKey.projectName);
    update(['project']);
  }

  void setOpenDrawerHandler(Function()? callback) {
    openDrawer = callback;
  }
}
