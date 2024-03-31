
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/base/base_view.dart';
import 'package:football_predictor_flutter/config/constants.dart';
import 'package:football_predictor_flutter/views/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends BaseView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: controller.obx((state) => _drawState(null),
          onLoading: drawLoading(),
          onEmpty: drawError('something_went_wrong'.tr),
          onError: (error) => drawError(error)),
    );
  }

  // region - Private

  _drawState(String? message, {bool error = false}) {
    return Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: Icon(),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //SizedBox(child: Images.navLogo.image),
            AnimatedSize(
                duration: Constants.standardAnimationDuration,
                child: message != null
                    ? error
                    ? _errorWidget(message)
                    : _loadingWidget(message)
                    : Container())
          ],
        ));
  }

  _loadingWidget(String message) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
        )
      ],
    );
  }

  _errorWidget(String message) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlinedButton(
            onPressed: () {
              controller.loadData();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0x10FFFFFF),
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.zero),
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            child: Text(
              'try_again'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}