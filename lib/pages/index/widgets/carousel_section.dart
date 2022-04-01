import 'package:card_swiper/card_swiper.dart';
import 'package:dc_flutter_cli/api/home_api.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/model/response/carousel_image_model.dart';
import 'package:dc_flutter_cli/pages/home/home_controller.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class CarouselSection extends HookWidget {
  const CarouselSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<CarouselImageModel>> images = useState([]);
    Future fetch() {
      return HomeAPI.getProjectImages().then(
        (value) {
          images.value = value;
          value.forEach((e) {
            Get.find<HomeController>().saveProjectInfo(
                projectName: e.projectName, projectLogo: e.projectLogo);
          });
        },
      );
    }

    useEffect(() {
      fetch();
      Get.find<app.IndexController>().registerRefreshCallback(fetch);
      return null;
    }, []);

    return Container(
      width: Get.width,
      height: 180,
      child: Swiper(
        autoplay: true,
        itemCount: images.value.length,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        pagination: images.value.isEmpty
            ? null
            : const SwiperPagination(alignment: Alignment.bottomCenter),
        itemBuilder: (BuildContext context, int i) {
          final CarouselImageModel item = images.value[i];
          return AppNetWorkImage(
            '${item.imageUrl}',
            fit: BoxFit.fill,
            width: Get.width,
            height: 180,
            radius: 5,
          );
        },
      ),
    );
  }
}
