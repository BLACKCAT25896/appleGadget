import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bikrify/common/controller/localization_controller.dart';
import 'package:bikrify/common/controller/theme_controller.dart';
import 'package:bikrify/common/model/messages.dart';
import 'package:bikrify/helper/di_container.dart';
import 'package:bikrify/helper/route_helper.dart';
import 'package:bikrify/theme/dark_theme.dart';
import 'package:bikrify/theme/light_theme.dart';
import 'package:bikrify/util/app_constants.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';


Future<void> main() async {
  if(GetPlatform.isIOS || GetPlatform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: themeController.darkTheme ? darkTheme : lightTheme,
          locale: localizeController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
          initialRoute: RouteHelper.dashboard,
          getPages: RouteHelper.routes,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
      );
    },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}