import 'package:football_predictor_flutter/views/home/home_binding.dart';
import 'package:football_predictor_flutter/views/home/home_view.dart';
import 'package:football_predictor_flutter/views/more/more_binding.dart';
import 'package:football_predictor_flutter/views/more/more_view.dart';
import 'package:football_predictor_flutter/views/root/root_view.dart';
import 'package:get/get.dart';

import '../views/root/root_binding.dart';
import '../views/splash/splash_binding.dart';
import '../views/splash/splash_view.dart';
import 'Routes.dart';

List<GetPage> getPages = [
  GetPage(
      name: Routes.root,
      transition: Transition.cupertino,
      page: () => const RootView(),
      binding: RootBinding()),
  GetPage(
      name: Routes.home,
      transition: Transition.cupertino,
      page: () => const HomeView(),
      binding: HomeBinding()),
  GetPage(
      name: Routes.more,
      transition: Transition.cupertino,
      page: () => const MoreView(),
      binding: MoreBinding()),
  GetPage(
      name: Routes.splash,
      transition: Transition.cupertino,
      page: () => const SplashView(),
      binding: SplashBinding())
];
