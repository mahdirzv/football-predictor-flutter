
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/base/base_view.dart';
import 'package:football_predictor_flutter/views/root/root_controller.dart';
import 'package:get/get.dart';

class RootView extends BaseView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        appBar: _getAppBar(),
        bottomNavigationBar: _getBottomNavBar(),
        body: _getBody(),
      ),
    );
  }

  Widget _getBottomNavBar() {
    return BottomNavigationBar(
      elevation: 3,
      currentIndex: controller.selectedIndex.value,
      onTap: controller.onTabTapped,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      items: controller.myTabs,
      selectedLabelStyle: const TextStyle(
        color: Color.fromRGBO(26, 26, 26, 1.0),
        fontSize: 12,
        fontFamily: 'SSportsD',
        fontWeight: FontWeight.w400,
      ),
      selectedItemColor: const Color.fromRGBO(26, 26, 26, 1.0),
      unselectedItemColor: const Color.fromRGBO(173, 173, 173, 1.0),
    );
  }

  _getAppBar() {
   return AppBar(
     title: Text('FP APP'),
   );
  }

  _getBody() {
    return IndexedStack(
        index: controller.selectedIndex.value, children: controller.tabs);
  }
}