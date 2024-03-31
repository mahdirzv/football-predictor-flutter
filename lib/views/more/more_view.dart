
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/base/base_view.dart';
import 'package:football_predictor_flutter/views/more/more_controller.dart';
import 'package:get/get.dart';

class MoreView extends BaseView<MoreController> {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: controller.obx((state) => const Text("More View"),
          onLoading: drawLoading(),
          onEmpty: drawError('something_went_wrong'.tr),
          onError: (error) => drawError(error)),
    );
  }
}