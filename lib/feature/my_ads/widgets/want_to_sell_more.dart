import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/custom_button.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:get/get.dart';

class WantToSellMore extends StatelessWidget {
  const WantToSellMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Container(padding: const EdgeInsets.symmetric(vertical : Dimensions.paddingSizeDefault, horizontal: Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
        color: Theme.of(context).hintColor.withOpacity(.125)),child: Column(children: [
          Row(children: [

            Image.asset(Images.sale, height: 70,width: 70,),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("want_to_sale_more".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Theme.of(context).primaryColor),),

              Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault, bottom: Dimensions.paddingSizeLarge),
                child: Text("post_more_ads".tr, style: textRegular,),
              ),
            ],))

          ],),
          CustomButton(buttonText: "show_me_package".tr,onPressed: (){},),
        ],
      ),),
    );
  }
}
