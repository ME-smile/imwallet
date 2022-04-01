import 'package:dc_flutter_cli/components/app_modal.dart';
import 'package:dc_flutter_cli/model/response/contract_quantificaion_plan_model.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class _AddPositionMode extends StatelessWidget {
  const _AddPositionMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('加仓方式'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('加仓委托')),
              Expanded(child: Text('张数')),
              Expanded(child: Text('涨跌幅度'))
            ],
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return GestureDetector(
                onTap: FocusManager.instance.primaryFocus?.unfocus,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('第$i轮'),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: '${math.pow(2, i)}',
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            initialValue: '${math.pow(2, i)}',
                            textAlign: TextAlign.end,
                            keyboardType: TextInputType.number,
                          )),
                          Text('%'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 10,
          )
        ],
      ),
    );
  }
}

Future<ContractQuantificationPlanModel?>
    showAddPositionModePopupModal<ContractQuantificationPlanModel>(
        {required BuildContext context}) {
  return showAppModalPopup<ContractQuantificationPlanModel>(
      context: context,
      builder: (BuildContext context) {
        return _AddPositionMode();
      });
}
