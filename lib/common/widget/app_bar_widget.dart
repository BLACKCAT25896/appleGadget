import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:get/get.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Function()? onBackPressed;
  final Function()? onTap;
  final bool regularAppbar;
  const CustomAppBar({super.key, required this.title, this.showBackButton = true, this.onBackPressed, this.onTap,  this.regularAppbar = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: regularAppbar? 100 :GetPlatform.isAndroid? 120: 150,
      color: Theme.of(context).primaryColor,
      child: AppBar(
        title: Text(title, style: textSemiBold.copyWith(
          fontSize: Dimensions.fontSizeExtraLarge,
          color: Colors.white,
        )),
        centerTitle: true,
        leading: showBackButton ? IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
        ) :
        SizedBox(
          width: Dimensions.iconSizeMedium,
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Image.asset(Images.logo, color: Colors.white,
                  width: Dimensions.iconSizeMedium),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize =>  Size(Dimensions.webMaxWidth, GetPlatform.isAndroid? Dimensions.androidAppBarHeight : Dimensions.appBarHeight);
}