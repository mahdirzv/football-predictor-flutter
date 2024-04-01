
import 'package:football_predictor_flutter/views/splash/splash_provider.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';
import '../../flavors.dart';
import '../../navigation/Routes.dart';

class SplashController extends BaseController {

  late List<String> availableLocations;
  late SplashProvider provider;
  bool locationChecked = false;

  @override
  void onInit() {
    super.onInit();

    provider = Get.put(SplashProvider(F.availableLocations));
    availableLocations = provider.availableLocations;
    loadData();
  }

  @override
  loadData() async {
    super.loadData();

    locationChecked = true;
    change(data, status: RxStatus.success());

    Future.microtask(() => Get.offNamed(Routes.root));
  }
}