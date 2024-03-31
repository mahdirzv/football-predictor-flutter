
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/base/base_controller.dart';
import 'package:football_predictor_flutter/base/base_widgets.dart';
import 'package:get/get.dart';

import 'application_bar.dart';

abstract class BaseView<T extends BaseController> extends GetView<T>
    with BaseWidgets {
  const BaseView({super.key});

  getAppBar(
      {required Function(String link) crossSellOnTap}) {
    return ApplicationBar(crossSellOnTap: crossSellOnTap);
  }

  drawError(String? error) {
    return Center(child: Text(error ?? "something_went_wrong".tr));
  }

  drawLoading() {

    return const Center(child: CircularProgressIndicator());
  }
}
