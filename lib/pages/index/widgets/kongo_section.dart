import 'package:dc_flutter_cli/model/ui/kongo_model.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class KongoSection extends HookWidget {
  const KongoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<KongoModel> kongos = useMemoized(() => [
          KongoModel(
            icon: R.icon.openAccount,
            label: AppLocaleKey.accountOpen.name.tr,
            path: AppRoutes.openAccount,
          ),
          KongoModel(
            icon: R.icon.bindAccount,
            label: AppLocaleKey.accountBind.name.tr,
            path: AppRoutes.accounts,
          ),
          KongoModel(
            icon: R.icon.team,
            label: AppLocaleKey.team.name.tr,
            path: '',
          ),
          KongoModel(
              icon: R.icon.invite,
              label: AppLocaleKey.invite.name.tr,
              path: AppRoutes.inviteFriend),
          KongoModel(
              icon: R.icon.manual,
              label: AppLocaleKey.manual.name.tr,
              path: AppRoutes.help),
        ]);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (KongoModel item in kongos)
            GestureDetector(
              onTap: () => Get.toNamed('${item.path}'),
              child: Column(
                children: [
                  Image.asset(
                    item.icon,
                    color: R.color.primary,
                    height: 64,
                  ),
                  // Gap(12),
                  Text(
                    item.label,
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: R.color.primaryTextColor,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
