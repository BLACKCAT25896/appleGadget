import 'package:flutter/material.dart';
import 'package:bikrify/common/widget/custom_button.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/images.dart';
import 'package:bikrify/util/styles.dart';
import 'package:get/get.dart';

class EmptyListed extends StatelessWidget {
  const EmptyListed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Container(child: Column(
        children: [
          Column(children: [

            Padding(padding: const EdgeInsets.only(bottom : Dimensions.paddingSizeLarge),
              child: Image.asset(Images.productList, height: 120,width: 120,),),
            Text("haven't_listed".tr,  style: textMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Theme.of(context).primaryColor)),
            Padding(
              padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault, bottom: Dimensions.paddingSizeLarge),
              child: Text("let_go".tr, style: textRegular),
            )

          ],),
          CustomButton(buttonText: "post".tr,onPressed: (){},),
        ],
      ),),
    );
  }
}
