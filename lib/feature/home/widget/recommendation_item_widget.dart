import 'package:bikrify/common/widget/custom_image.dart';
import 'package:bikrify/common/widget/favourite_button.dart';
import 'package:bikrify/feature/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:bikrify/feature/product_details/product_details_screen.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/styles.dart';
import 'package:get/get.dart';

class RecommendationItem extends StatefulWidget {
  final Product productModel;
  const RecommendationItem({Key? key, required this.productModel}) : super(key: key);

  @override
  State<RecommendationItem> createState() => _RecommendationItemState();
}

class _RecommendationItemState extends State<RecommendationItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()=> Get.to(()=>  ProductDetailsScreen(productModel: widget.productModel,)),
      child: Container(width: Get.width/2,
        margin: const EdgeInsets.symmetric(vertical : Dimensions.paddingSizeExtraSmall),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
            color: Theme.of(context).cardColor, border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.125))),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

            Padding(padding: const EdgeInsets.all(6.0),
              child: Container(height: 180,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.2),width: .25),
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.all( Radius.circular(10))),
                child: ClipRRect(borderRadius: const BorderRadius.all( Radius.circular(10)),
                  child: CustomImage(image: '${widget.productModel.image}',)))),




            Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall,Dimensions.paddingSizeExtraSmall),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [


                Text("\$9878756786", style: textBold.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge)),

                Text(widget.productModel.name!, style: textRegular, maxLines: 2,
                    overflow: TextOverflow.ellipsis, textAlign: TextAlign.start),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),
              ],
              ),
            ),
          ]),



          Positioned(top: 17, left: 9,
            child: Container(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              height: 25, alignment: Alignment.center,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
              child: Text("Featured", style: textRegular.copyWith(color: Theme.of(context).cardColor,
                  fontSize: Dimensions.fontSizeSmall)))),



          Positioned(top: 15, right: 15, child: FavouriteButton(
            backgroundColor: Theme.of(context).canvasColor,
            productId : 45)),

        ]),
      ),
    );
  }
}
