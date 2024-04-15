import 'package:flutter_boilerplate/feature/deshboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/feature/splash_screen/splash_screen.dart';
import 'package:get/get.dart';


class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String dashboard = '/dashboard';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getHomeRoute() => home;
  static getDashboardRoute() => dashboard;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const DashboardScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const SplashScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
  ];
}