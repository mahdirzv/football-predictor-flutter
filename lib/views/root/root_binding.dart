
import 'package:football_predictor_flutter/views/more/more_controller.dart';
import 'package:football_predictor_flutter/views/root/root_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MoreController>(() => MoreController());
  }
}