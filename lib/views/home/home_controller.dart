import 'package:football_predictor_flutter/base/base_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class HomeController extends BaseController {

  @override
  void onInit() {

    super.onInit();
    change(data, status: RxStatus.success());
  }
}
