import 'package:dc_flutter_cli/pages/assets/widgets/assets_brief_section.dart';
import 'package:dc_flutter_cli/pages/assets/widgets/assets_kongo_section.dart';
import 'package:dc_flutter_cli/pages/assets/widgets/profit_rank_section.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

class AssetsPage extends HookWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收益'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AssetsBriefSection(),
              ),
              SliverGap(18),
              SliverToBoxAdapter(
                child: AssetsKongoSection(),
              ),
              SliverGap(16),
              SliverToBoxAdapter(
                child: ProfitRankSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
