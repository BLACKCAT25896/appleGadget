import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/common/widget/animated_custom_dialog.dart';
import 'package:flutter_boilerplate/common/widget/logout_dialog.dart';
import 'package:flutter_boilerplate/feature/deshboard/controller/menu_controller.dart';
import 'package:flutter_boilerplate/feature/deshboard/widget/unicorn_outline_button.dart';
import 'package:flutter_boilerplate/feature/splash_screen/splash_screen.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:get/get.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    Get.find<MenuItemController>().selectHomePage(isUpdate: false);

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
          onPopInvoked: (val) => _onWillPop(context),
          child: GetBuilder<MenuItemController>(builder: (menuController) {
            return Scaffold(
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              body: PageStorage(bucket: bucket, child: menuController.currentScreen),

              floatingActionButton: UnicornOutlineButton(
                strokeWidth: 1.5,
                radius: 50,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.5),
                    Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
                    Theme.of(context).primaryColor.withOpacity(0.05),
                    Theme.of(context).primaryColor.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  elevation: 1,
                  onPressed: (){
                    menuController.selectCreatePostPage();
                  },
                  child: Icon(Icons.add, color: Theme.of(context).primaryColor,size: 30,),
                ),
              ),

              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.14),
                      blurRadius: 80, offset: const Offset(0, 20),
                    ),
                    BoxShadow(
                      color:Theme.of(context).primaryColor.withOpacity(0.20),
                      blurRadius: 0.5, offset: const Offset(0, 0),
                    ),
                  ],
                ),

                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customBottomItem(
                      tap: () => menuController.selectHomePage(),
                      icon: menuController.currentTab == 0
                          ? Images.homeIconBold : Images.homeIcon,
                      name: 'home'.tr,
                      selectIndex: 0,
                    ),

                    customBottomItem(
                      tap: () => menuController.selectHistoryPage(),
                      icon: menuController.currentTab == 1
                          ? Images.clockIconBold : Images.clockIcon,
                      name: 'chats'.tr, selectIndex: 1,
                    ),
                    const SizedBox(height: 20, width: 20),

                    customBottomItem(
                      tap: () => menuController.selectNotificationPage(),
                      icon: menuController.currentTab == 2
                          ? Images.notificationIconBold : Images.notificationIcon,
                      name: 'my_ads'.tr, selectIndex: 2,
                    ),

                    customBottomItem(
                      tap: () => menuController.selectProfilePage(),
                      icon: menuController.currentTab == 3
                          ? Images.profileIconBold : Images.profileIcon,
                      name: 'profile'.tr,
                      selectIndex: 3,
                    ),
                  ],
                ),
              ),
            );
          }),
        );


  }

  Future<bool> _onWillPop(BuildContext context) async {
    showAnimatedDialog(context,
        CustomDialog(
          icon: Icons.exit_to_app_rounded, title: 'exit'.tr, description: 'do_you_want_to_exit_the_app'.tr, onTapFalse:() => Navigator.of(context).pop(false),
          onTapTrue:() {
            SystemNavigator.pop().then((value) => Get.offAll(()=> const SplashScreen()));

            },
          onTapTrueText: 'yes'.tr, onTapFalseText: 'no'.tr,
        ),
        dismissible: false,
        isFlip: true);
    return true;
  }

  Widget customBottomItem({required String icon, required String name, VoidCallback? tap, int? selectIndex}) {
    return InkWell(onTap: tap, child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: 20,
        width: Dimensions.fontSizeExtraLarge,
        child: Image.asset(
          icon, fit: BoxFit.contain,
          color: Get.find<MenuItemController>().currentTab == selectIndex ? Theme.of(context).textTheme.titleLarge!.color : Theme.of(context).cardColor,
        ),
      ),
      const SizedBox(height: 6.0),

      Text(name, style: TextStyle(
        color: Get.find<MenuItemController>().currentTab == selectIndex
            ? Theme.of(context).textTheme.titleLarge!.color : Theme.of(context).cardColor,
        fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400,
      ))

    ]));
  }
}
