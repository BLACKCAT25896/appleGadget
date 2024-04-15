
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikrify/common/controller/theme_controller.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/images.dart';
import 'package:bikrify/util/styles.dart';
import 'package:get/get.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [

          Stack(clipBehavior: Clip.none, children: [

            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(transform: Matrix4.translationValues(-55, 0, 0),
                width: Get.width * 1.3, height: 350,
                decoration: const BoxDecoration(
                    color: Color(0x424242ff), borderRadius: BorderRadius.vertical(bottom: Radius.circular(270))),

              ),
            ),




            Container(width: Get.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(70))
              ),
              child: Padding(padding: const EdgeInsets.only(top: 100.0),
                child: Column(children: [
                  Container(width: 100, height: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(75),),
                      child: ClipRRect(borderRadius: BorderRadius.circular(75), child: Image.asset(Images.logo))),

                  Text('Olivia Austin',style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text('oliviaaustin@gmail.com', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),

                ],
                ),),
            ),
          ],
          ),

          Padding(padding: const EdgeInsets.all(15),
            child: Container(transform: Matrix4.translationValues(0, -70, 0),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
              height: 500,decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20)
              ),child: Column(mainAxisSize: MainAxisSize.max,children: [

                GetBuilder<ThemeController>(
                  builder: (themeController) {
                    return Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Row(children: [
                          Icon(themeController.darkTheme? Icons.nightlight : Icons.sunny, size: 25, color: Theme.of(context).primaryColor),
                          const SizedBox(width: 10),
                          Text(themeController.darkTheme? 'dark_mode'.tr : "light_mode".tr),
                        ],
                        ),

                        CupertinoSwitch(
                          activeColor: Theme.of(context).primaryColor,
                          applyTheme: true,
                          trackColor: const Color(0xffB5B6D7),
                          thumbColor: Colors.white,
                          value:themeController.darkTheme,
                          onChanged: (val) => themeController.toggleTheme(),
                        )
                      ],
                      ),
                    );
                  }
                ),

                InkWell( child: ProfileHeader(icon: Images.logo, title: 'edit_profile'.tr)),
                InkWell(child: ProfileHeader(icon: Images.logo, title: 'language'.tr)),
                InkWell( child: ProfileHeader(icon: Images.logo, title: 'my_orders'.tr)),
                InkWell( child: ProfileHeader(icon: Images.logo, title: 'my_address'.tr)),

              ],),),
          )


        ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String icon;
  final String title;
  const ProfileHeader({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      child: Container(padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).canvasColor,
            boxShadow:  [BoxShadow( color: Theme.of(context).hintColor.withOpacity(.35), spreadRadius: 2, blurRadius: 5, offset: const Offset(0,0))]),
        child: Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeLarge, Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall),
          child: Row(children: [
            SizedBox(width: Dimensions.iconSizeSmall, child: Image.asset(icon,)),
            const SizedBox(width: Dimensions.paddingSizeDefault,),
            Expanded(child: Text(title, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
            Icon(Icons.arrow_forward_ios,size: 10, color: Theme.of(context).hintColor,)


          ],),
        ),
      ),
    );
  }
}
