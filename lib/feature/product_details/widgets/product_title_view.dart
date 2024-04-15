import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/controller/theme_controller.dart';
import 'package:flutter_boilerplate/common/widget/rating_bar.dart';
import 'package:flutter_boilerplate/feature/home/model/product_model.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:get/get.dart';

class ProductTitleView extends StatelessWidget {
  final Product product;
  const ProductTitleView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return  Container(
      padding: const EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeDefault),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

        Text(product.name ?? '', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge), maxLines: 2),
        const SizedBox(height: Dimensions.paddingSizeDefault),


        Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
          child: Row(children: [


            Text( '\$${product.price}',
              style: textMedium.copyWith(color: Theme.of(context).primaryColor,
                  fontSize: Dimensions.fontSizeLarge),
            ),


            Flexible(child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                child: Text('${1245} - ${54656}',
                  style: textRegular.copyWith(color: Theme.of(context).hintColor, decoration: TextDecoration.lineThrough),),),),


              Container(padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.error.withOpacity(.20),
                    borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)),
                child: Text("\$234",
                  style: textRegular.copyWith(color:Theme.of(context).colorScheme.error, fontSize: Dimensions.fontSizeLarge),
                ),
              ),
          ],
          ),
        ),


        Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
          child: Row(children: [
            RatingBar(rating:  product.ratting!),
            const Text('(234567)', style: textRegular,)
          ],),
        ),


        Row(children: [
          Text.rich(TextSpan(children: [
            TextSpan(text: '${10} ', style: textMedium.copyWith(
                color: Get.find<ThemeController>().darkTheme? Theme.of(context).hintColor : Theme.of(context).primaryColor,
                fontSize: Dimensions.fontSizeDefault)),
            TextSpan(text: '${"reviews".tr} | ', style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault,))])),


          Text.rich(TextSpan(children: [
            TextSpan(text: '${23435} ', style: textMedium.copyWith(
                color: Get.find<ThemeController>().darkTheme? Theme.of(context).hintColor : Theme.of(context).primaryColor,
                fontSize: Dimensions.fontSizeDefault)),
            TextSpan(text: '${"orders".tr} | ', style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault,))])),

          Text.rich(TextSpan(children: [
            TextSpan(text: '${43445} ', style: textMedium.copyWith(
                color: Get.find<ThemeController>().darkTheme? Theme.of(context).hintColor : Theme.of(context).primaryColor,
                fontSize: Dimensions.fontSizeDefault)),
            TextSpan(text: "wish_listed".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault,))])),



        ]),
        const SizedBox(height: Dimensions.paddingSizeSmall),

      ]),
    );
  }
}
