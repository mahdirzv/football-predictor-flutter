
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/base/base_container.dart';
import 'package:football_predictor_flutter/base/date_picker.dart';
import 'package:football_predictor_flutter/resources/app_colours.dart';
import 'package:football_predictor_flutter/resources/app_font_styles.dart';
import 'package:football_predictor_flutter/views/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../base/base_view.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white7,
            AppColors.white1,
          ],
        ),
      ),
      child: controller.obx((state) => _getBody(context),
          onLoading: drawLoading(),
          onEmpty: drawError('something_went_wrong'.tr),
          onError: (error) => drawError(error)),
    );
  }

  _getBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          _getAccuracyWidget(),
          const SizedBox(height: 16),
          _getDatePicker(context)
        ],
      ),
    );
  }

  _getAccuracyWidget() {
    return BaseContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.black1,
        bgOpacity: 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Model Accuracy',
                style: AppStyles.nunitoBold.copyWith(fontSize: 16, color: AppColors.white5)),

            CircularPercentIndicator(
              radius: 24.0,
              lineWidth: 5.0,
              percent: 0.9,
              center: Text(
                '${(0.9 * 100).toStringAsFixed(0)}%',
                style: AppStyles.nunitoBlack.copyWith(fontSize: 12, color: AppColors.white5),
              ),
              progressColor: AppColors.white1,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
    );
  }
  _getDatePicker(BuildContext context) {
    return AppDatePicker(
      selectedDate: controller.selectedDate.value,
      scrollController: controller.scrollController,
      onDateSelected: (date) => controller.onDateSelected(date, context),
    );
  }
}
