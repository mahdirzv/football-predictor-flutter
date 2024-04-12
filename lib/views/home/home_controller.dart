import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:football_predictor_flutter/base/base_controller.dart';
import 'package:football_predictor_flutter/views/home/home_provider.dart';
import 'package:football_predictor_flutter/views/home/widgets/expandable_match_list.dart';
import 'package:get/get.dart';

import 'home_data_models.dart';

class HomeController extends BaseController {
  late HomeProvider provider;
  final itemWidth = 60.0 + 8.0;
  final scrollController = ScrollController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<CompetitionDataClass> matchData = CompetitionDataClass().obs;

  @override
  void onInit() {
    super.onInit();

    provider = Get.put(HomeProvider());

    loadData();
  }

  @override
  loadData() async {
    super.loadData();

    await provider.fetchCompetitionData().then((matches) {
      matchData.value = matches;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToItem(selectedDate.value, Get.context!);
    });

    change(data, status: RxStatus.success());
  }

  void onExpansionChanged(int idx, bool isExpanded) {
    //expandableData[idx].isExpanded = isExpanded;
    update();
  }

  void onDateSelected(DateTime date, BuildContext context) {

    if (date != selectedDate.value) {
      selectedDate.value = date;
      scrollToItem(date, context);
      update();
    }
  }

  void scrollToItem(DateTime date, BuildContext context) {
    DateTime normalizedNow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime normalizedTargetDate = DateTime(date.year, date.month, date.day);
    final selectedIndex = normalizedTargetDate.difference(normalizedNow).inDays + 10;
    final screenWidth = context.mediaQuerySize.width;
    var targetScrollOffset = (selectedIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2) + 12;

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
