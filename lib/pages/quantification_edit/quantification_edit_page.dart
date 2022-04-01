import 'package:dc_flutter_cli/components/app_modal.dart';
import 'package:dc_flutter_cli/components/app_slider.dart' as app;
import 'package:dc_flutter_cli/model/ui/plan_option_model.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/quantification_edit_controller.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/sheets/add_position_mode.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/sheets/switch_currency_sheet.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/widgets/account_section.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/res/max_money_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class QuantificationEditPage extends HookWidget {
  const QuantificationEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> p = useState(0);
    final List<PlanOptionModel> options = useMemoized(() => [
          PlanOptionModel(
            title: '触发要求',
            description: '当行情达到设定的限价时，首单不再新开委托。建议设置，以免多单高位或空单低位被套',
          ),
          PlanOptionModel(
              title: '首单数量',
              description: '首次开仓委托的数量。请根据账户权益审慎设定，特别是合约，仓位太重，会有爆仓风险',
              value: '2',
              unit: '张',
              hasTrailing: true),
          PlanOptionModel(
              title: '加仓次数',
              description: '设定单次循环时允许加仓的次数。请综合各项参数，审慎设定',
              value: '6',
              unit: '次',
              hasTrailing: true),
          PlanOptionModel(
              title: '加仓方式',
              description: '请点击右侧箭头，在新页面中，详细设置加仓的方式',
              onTap: () {
                showAddPositionModePopupModal(context: context);
              }),
          PlanOptionModel(
            title: '平仓设置',
            description: '请点击右侧箭头，在新页面中设置平仓的各项参数',
          ),
          PlanOptionModel(
            title: '即时止盈',
            description:
                '止盈幅度为0时，将按默认算法自动止盈\n止盈幅度不为0时，将按加仓价格和所设参数止盈\n即时止盈仅止盈最新加仓部分仓位',
          ),
          PlanOptionModel(
            title: '止盈止损',
            description: '请点击右侧箭头，在新页面中设置强制止盈止损的各项参数',
          ),
          PlanOptionModel(
            title: '智能风控',
            description: '最后一轮加仓成交后，将进入智能风控流程并自动解套',
          ),
        ]);
    return GetBuilder<QuantificaionEditController>(builder: (_) {
      return GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          appBar: AppBar(
            title: Text('新增量化'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AccountSection(),
                ),
                SliverGap(16),
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      showAppModalPopup<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return SwitchCurrencySheet();
                          }).then((value) {
                        if (value == null) return;
                        _.setCurrency(value);
                      });
                    },
                    child: Row(
                      children: [
                        Text('选择币种'),
                        Gap(18),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Get.theme.inputDecorationTheme.fillColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${_.currency}'),
                                Image.asset(R.icon.next)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverGap(18),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.inputDecorationTheme.fillColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text('买多'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: MaxMoneyColor.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text('买空'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.inputDecorationTheme.fillColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text('双向'),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(R.icon.uncheckedRadio),
                                Gap(4),
                                Text('自动循环'),
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(R.icon.checkedRadio),
                                Gap(4),
                                Text(
                                  '单次循环',
                                  style: TextStyle(
                                    color: MaxMoneyColor.primary,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverGap(18),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text('杠杆倍数'),
                          Gap(18),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    initialValue: '${p.value}',
                                    onChanged: (String v) {
                                      p.value = double.tryParse(v) ?? p.value;
                                    },
                                  ),
                                ),
                                Text('X'),
                              ],
                            ),
                          ),
                          Expanded(child: Text('可用1234张')),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(0, -8),
                        child: Transform.scale(
                          scaleX: 1.08,
                          child: SliderTheme(
                            data: SliderThemeData(
                                activeTrackColor: MaxMoneyColor.primary,
                                inactiveTickMarkColor:
                                    MaxMoneyColor.primary.withOpacity(.5),
                                thumbColor: MaxMoneyColor.primary,
                                trackHeight: 2,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8),
                                trackShape: app.RoundedRectSliderTrackShape(),
                                tickMarkShape: app.DotSliderTickMarkShape(
                                    tickMarkRadius: 5,
                                    tickMarkColor:
                                        MaxMoneyColor.primary.withOpacity(.9))),
                            child: app.Slider(
                              max: 125,
                              min: 0,
                              value: p.value,
                              divisions: 5,
                              label: '${p.value.toInt()}X',
                              onChanged: (v) {
                                p.value = v;
                                print(p.value);
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text('量化类型'),
                      Gap(18),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          decoration: BoxDecoration(
                            color: Get.theme.inputDecorationTheme.fillColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('系统推荐'),
                        ),
                      ),
                      Gap(12),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          decoration: BoxDecoration(
                            color: MaxMoneyColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('个性定制'),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverGap(18),
                SliverList(
                  delegate:
                      SliverChildBuilderDelegate((BuildContext context, int i) {
                    final PlanOptionModel item = options[i];
                    return GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (item.onTap != null) item.onTap!();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 36,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                                color: Get.theme.inputDecorationTheme.fillColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${item.title}',
                                    ),
                                    Gap(12),
                                    SvgPicture.asset(
                                      R.icon.questionMark,
                                      width: 16,
                                      height: 16,
                                      color: Get.textTheme.labelLarge?.color,
                                    ),
                                  ],
                                ),
                                if (item.hasTrailing)
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Transform.translate(
                                            offset: Offset(0, -2),
                                            child: TextFormField(
                                              textAlign: TextAlign.end,
                                              initialValue: '${item.value}',
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                        Text('${item.unit}'),
                                      ],
                                    ),
                                  )
                                else ...[Spacer(), Image.asset(R.icon.next)]
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }, childCount: options.length),
                ),
                SliverGap(6),
                SliverToBoxAdapter(
                  child: Center(child: Text('当前交易未成交委托按修改后的参数执行')),
                ),
                SliverGap(32),
                SliverToBoxAdapter(
                  child: ElevatedButton(onPressed: () {}, child: Text('确认新增')),
                ),
                SliverGap(32 + Get.mediaQuery.padding.bottom)
              ],
            ),
          ),
        ),
      );
    });
  }
}
