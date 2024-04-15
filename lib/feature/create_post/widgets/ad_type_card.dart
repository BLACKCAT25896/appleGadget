import 'package:flutter/material.dart';
import 'package:bikrify/feature/create_post/models/ad_type_model.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/styles.dart';
import 'package:get/get.dart';

class AdTypeCard extends StatelessWidget {
  final AdTypeModel adTypeModel;
  final Function()? onTap;
  final Function()? onPress;
  const AdTypeCard({super.key, required this.adTypeModel, this.onTap, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, 0),
      child: Container(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
            color: Theme.of(context).cardColor),
        child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Row(children: [
            Image.asset(adTypeModel.icon, height: 30,width: 30,),
            const SizedBox(width: Dimensions.paddingSizeSmall,),
            Text(adTypeModel.title.tr,  style: textMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Theme.of(context).primaryColor)),]),
          InkWell(onTap: onTap,
            child: Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
              child: Row(children: [
                Expanded(child: Text(adTypeModel.title.tr,  style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).primaryColor))),

                Icon(Icons.arrow_forward_ios, size: 18, color: Theme.of(context).hintColor,)
              ],
              ),),
          ),
          Divider(height: 25, thickness: .25,color: Theme.of(context).hintColor.withOpacity(.5),),
          InkWell(onTap: onPress,
            child: Row(children: [
              Expanded(child: Text(adTypeModel.subTitle.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).primaryColor))),
              Icon(Icons.arrow_forward_ios, size: 18, color: Theme.of(context).hintColor,)

            ],
            ),
          ),

        ],),),
    );
  }
}