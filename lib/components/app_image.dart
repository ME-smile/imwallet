import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppNetWorkImage extends HookWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool cache;
  final double radius;
  const AppNetWorkImage(
    this.url, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.radius = 0.0,
    this.cache = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.asset(
        'assets/images/image_load_failed.png',
        fit: fit,
      ),
    );
    final AnimationController _controller = useAnimationController(
        duration: const Duration(milliseconds: 1800),
        lowerBound: 0.0,
        upperBound: 1.0);
    useListenable(_controller);
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: fit,
      borderRadius: BorderRadius.circular(radius),
      loadStateChanged: (ExtendedImageState state) {
        if (state == LoadState.loading) {
          _controller.reset();
          return Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: CupertinoActivityIndicator());
        }
        if (state == LoadState.failed) {
          _controller.reset();
          state.imageProvider.evict();
          return Container(
            width: width,
            height: height,
            child: Image.asset(
              'assets/images/image_load_failed.png',
              fit: fit,
            ),
          );
        }
        _controller.forward();
        return FadeTransition(
          opacity: _controller,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        );
      },
    );
  }
}
