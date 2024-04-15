import 'package:flutter_boilerplate/feature/chat/inbox_screen.dart';
import 'package:flutter_boilerplate/feature/create_post/create_post_screen.dart';
import 'package:flutter_boilerplate/feature/home/view/home_screen_view.dart';
import 'package:flutter_boilerplate/feature/my_ads/my_ads_screen.dart';
import 'package:flutter_boilerplate/feature/profile/view/profile_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItemController extends GetxController implements GetxService{
  int _currentTab = 0;
  int get currentTab => _currentTab;
  final List<Widget> screen = [
    const HomeScreenView(),
    const InboxScreen(),
    const MyAdsScreen(),
    const ProfileScreen()
  ];
  Widget _currentScreen = const HomeScreenView();
  Widget get currentScreen => _currentScreen;

  resetNavBar(){
    _currentScreen = const HomeScreenView();
    _currentTab = 0;
  }

  selectHomePage({bool isUpdate = true}) {
    _currentScreen = const HomeScreenView();
    _currentTab = 0;
    if(isUpdate) {
      update();
    }
  }

  selectHistoryPage() {
    _currentScreen = const InboxScreen();
    _currentTab = 1;
    update();
  }

  selectNotificationPage() {
    _currentScreen = const MyAdsScreen();
    _currentTab = 2;
    update();
  }

  selectProfilePage() {
    _currentScreen = const ProfileScreen();
    _currentTab = 3;
    update();
  }
  selectCreatePostPage() {
    _currentScreen = const CreatePostScreen();
    _currentTab = 4;
    update();
  }
}
