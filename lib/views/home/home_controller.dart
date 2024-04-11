import 'package:flutter/cupertino.dart';
import 'package:football_predictor_flutter/base/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final itemWidth = 60.0 + 8.0;
  final scrollController = ScrollController();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {

    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToItem(selectedDate.value, Get.context!);
    });

    change(data, status: RxStatus.success());
  }

  void onDateSelected(DateTime date, BuildContext context) {

    if (date != selectedDate.value) {
      selectedDate.value = date;
      scrollToItem(date, context);
      update();
    }
  }

  void scrollToItem(DateTime date, BuildContext context) {
    final selectedIndex = date.difference(DateTime.now()).inDays + 10;
    final screenWidth = context.mediaQuerySize.width;
    var targetScrollOffset = (selectedIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2) + 4;

    targetScrollOffset = targetScrollOffset.clamp(scrollController.position.minScrollExtent, scrollController.position.maxScrollExtent);

    Future.microtask(() {
      scrollController.animateTo(
        targetScrollOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
