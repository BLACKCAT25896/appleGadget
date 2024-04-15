import 'package:flutter/material.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/styles.dart';
import 'package:get/get.dart';

class TypesItem extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final int selectedIndex;
  final int index;
  const TypesItem({super.key, this.onTap, required this.selectedIndex, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Column(children: [
          Center(child: Text(title,
            style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                color: selectedIndex == index? Theme.of(context).primaryColor : Theme.of(context).hintColor),)),

          const SizedBox(height: Dimensions.paddingSizeSmall,),
          Container(width: Get.width, height: 3,color: selectedIndex == index? Theme.of(context).primaryColor : Colors.transparent,),
        ],
      ),
    );
  }
}
