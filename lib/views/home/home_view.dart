
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/views/home/home_controller.dart';
import 'package:get/get.dart';

import '../../base/base_view.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: controller.obx((state) => const Text("Home View"),
          onLoading: drawLoading(),
          onEmpty: drawError('something_went_wrong'.tr),
          onError: (error) => drawError(error)),
    );
  }
}