import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/components/app_tabbar_view.dart';
import 'package:dc_flutter_cli/components/app_user_avatar.dart';
import 'package:dc_flutter_cli/delegates/ui/sliver_tabBar_delegate.dart';
import 'package:dc_flutter_cli/model/response/user_profile_model.dart';
import 'package:dc_flutter_cli/model/ui/transaction_type_model.dart';
import 'package:dc_flutter_cli/pages/home/home_controller.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart';
import 'package:dc_flutter_cli/pages/index/widgets/carousel_section.dart';
import 'package:dc_flutter_cli/pages/index/widgets/kongo_section.dart';
import 'package:dc_flutter_cli/pages/index/widgets/message_badge.dart';
import 'package:dc_flutter_cli/pages/index/widgets/notification_bar.dart';
import 'package:dc_flutter_cli/pages/index/widgets/profit_section.dart';
import 'package:dc_flutter_cli/pages/index/widgets/transaction_record_tab_view.dart';
import 'package:dc_flutter_cli/storage/sp_util.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IndexPage extends HookWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProfileModel? user =
        UserProfileModel.fromJson(SpUtil.getJson(SpKey.user) ?? {});

    final List<TransactionTypeModel> transactionTypes = [
      TransactionTypeModel(label: AppLocaleKey.profit.name.tr, type: 1),
      TransactionTypeModel(label: AppLocaleKey.revenue.name.tr, type: 2),
      TransactionTypeModel(label: AppLocaleKey.winRate.name.tr, type: 3),
      TransactionTypeModel(label: AppLocaleKey.retracement.name.tr, type: 4),
      TransactionTypeModel(label: AppLocaleKey.frequency.name.tr, type: 5),
    ];

    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return GestureDetector(
              onTap: Get.find<IndexController>().openDrawer,
              child: Row(
                children: [
                  Gap(8),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: AppUserAvatar(
                        url: '${user?.avatar ?? ''}',
                      )),
                ],
              ),
            );
          }),
          title: GetBuilder<HomeController>(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppNetWorkImage(
                  '${_.projectLogo}',
                  height: 32,
                  width: 32,
                ),
                Gap(8),
                Text('${_.projectName}'),
              ],
            );
          }),
          actions: [
            MessageBadge(),
          ],
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: GetBuilder<IndexController>(builder: (_) {
          return RefreshIndicator(
            onRefresh: () {
              return Get.find<IndexController>().refreshData();
            },
            child: DefaultTabController(
              length: transactionTypes.length,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          CarouselSection(),
                          Gap(18),
                          NotificationBar(),
                          Gap(18),
                          KongoSection(),
                          Gap(32),
                          ProfitSection(),
                          Gap(20),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: SliverTabBarDelegate(
                      widget: PreferredSize(
                        preferredSize: Size.fromHeight(48),
                        child: Container(
                          color: Get.theme.scaffoldBackgroundColor,
                          child: TabBar(
                            tabs: [
                              for (TransactionTypeModel item
                                  in transactionTypes)
                                Tab(
                                  text: item.label,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AppTabBarView(children: [
                      for (TransactionTypeModel item in transactionTypes)
                        TransactionRecordTabView(
                          type: item.type,
                          // scrollController: scrollController,
                        )
                    ]),
                  )
                ],
              ),
              // child: NestedScrollView(
              //   headerSliverBuilder:
              //       (BuildContext context, bool innerBoxIsScrolled) {
              //     return [

              //     ];
              //   },
              //   body: TabBarView(children: [
              //     for (TransactionTypeModel item in transactionTypes)
              //       TransactionRecordTabView(
              //         type: item.type,
              //         scrollController: scrollController,
              //       )
              //   ]),
              // ),
              // child: CustomScrollView(
              //   controller: scrollController,
              //   slivers: [
              // SliverToBoxAdapter(
              //   child: Container(
              //     margin: EdgeInsets.symmetric(horizontal: 12),
              //     child: Column(
              //       children: [
              //         CarouselSection(),
              //         Gap(18),
              //         NotificationBar(),
              //         Gap(18),
              //         KongoSection(),
              //         Gap(32),
              //         ProfitSection(),
              //         Gap(20),
              //       ],
              //     ),
              //   ),
              // ),
              // SliverPersistentHeader(
              //   pinned: true,
              //   floating: true,
              //   delegate: SliverTabBarDelegate(
              //     widget: PreferredSize(
              //       preferredSize: Size.fromHeight(48),
              //       child: Container(
              //         color: Get.theme.primaryColor,
              //         child: TabBar(
              //           tabs: [
              //             for (TransactionTypeModel item in transactionTypes)
              //               Tab(
              //                 text: item.label,
              //               ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: AppTabBarView(
              //       estimatedPageSize: MediaQuery.of(context).size.height,
              //       children: [
              //         for (TransactionTypeModel item in transactionTypes)
              //           TransactionRecordTabView(
              //             type: item.type,
              //             scrollController: scrollController,
              //           )
              //       ]),
              // )
              //   ],
              // ),
            ),
          );
        }));
  }
}
