import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/controllers/user_controller.dart';
import 'package:dc_flutter_cli/model/response/carousel_image_model.dart';
import 'package:dc_flutter_cli/model/response/home_data_model.dart';
import 'package:dc_flutter_cli/model/response/user_profile_model.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart' as app;
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureLoadStateBuilder<app.IndexController>(builder: (_) {
      final HomeDataModel? data = _.homeData;
      final UserProfileModel? user = data?.user;
      final List<CarouselImageModel> carousels = data?.carousels ?? [];
      return Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Row(
            children: [
              Gap(8),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  ('${user?.avatar ?? ''}'),
                  width: 28,
                  height: 28,
                ),
              ),
            ],
          ),
          title: Text('1'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: Get.width,
                color: Colors.red,
                height: 180,
                child: Swiper(
                  autoplay: true,
                  itemCount: carousels.length,
                  scrollDirection: Axis.horizontal,
                  pagination:
                      const SwiperPagination(alignment: Alignment.bottomCenter),
                  itemBuilder: (BuildContext context, int i) {
                    CarouselImageModel item = carousels[i];
                    return Image.network(
                      '${item.imageUrl}',
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
