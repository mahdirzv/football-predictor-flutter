
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/base/base_controller.dart';
import 'package:football_predictor_flutter/views/home/home_view.dart';
import 'package:football_predictor_flutter/views/more/more_view.dart';
import 'package:get/get.dart';

class RootController extends BaseController with GetSingleTickerProviderStateMixin {

  final List<Widget> tabs = <Widget>[
    const HomeView(),
    const MoreView(),
  ];

  final List<BottomNavigationBarItem> myTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: 'home'.tr,
        tooltip: 'home'.tr),
    BottomNavigationBarItem(
        icon: const Icon(Icons.add),
        label: 'more'.tr,
        tooltip: 'more'.tr),
  ];

  late TabController tabController;
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: myTabs.length);
    loadData();
  }

  @override
  loadData() async {
    super.loadData();
    change(data, status: RxStatus.success());
  }

  void onTabTapped(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
    }
  }

  menuItemSelected(String? link) {
    Get.back();
    if (link != null) {
      //LinkMgr.handleLink(link);
    }
  }
}