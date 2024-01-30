import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/bouncy_widget.dart';
import 'package:flutter_boilerplate/feature/home/view/home_screen_view.dart';
import 'package:flutter_boilerplate/feature/login/login_controller.dart';
import 'package:flutter_boilerplate/feature/login/login_screen.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _route();
  }


  void _route() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if(Get.find<AuthController>().isLoggedIn()){
       Get.offAll(()=> const HomeScreenView());
      }else{
        Get.offAll(()=> const LoginScreen());
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body:  Container(color: Theme.of(context).cardColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: BouncyWidget(  duration: const Duration(milliseconds: 2000), lift: 50, ratio: 0.5, pause: 0.25,
              child: Image.asset(Images.logo, fit: BoxFit.contain)),),
      ),
    );
  }

}
