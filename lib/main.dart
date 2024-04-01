import 'dart:async';
import 'package:flutter/material.dart';
import 'package:football_predictor_flutter/resources/translations.dart';
import 'package:get/get.dart';
import 'flavors.dart';
import 'navigation/Routes.dart';
import 'navigation/pages.dart';

FutureOr<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  _injectDependencies();

  runApp(GetMaterialApp(
    title: F.title,
    initialRoute: Routes.splash,
    defaultTransition: Transition.native,
    translations: AppTranslations(),
    debugShowCheckedModeBanner: false,
    getPages: getPages,
    locale: const Locale('en', 'GB')
  ));
}

Future<void> _injectDependencies() async {

  //Get.put(BaseController<DataModel>());
}