import 'package:flutter/material.dart';
import 'package:bikrify/common/widget/app_bar_widget.dart';
import 'package:bikrify/common/widget/custom_button.dart';
import 'package:bikrify/feature/home/model/product_model.dart';
import 'package:bikrify/feature/product_details/widgets/product_image_view.dart';
import 'package:bikrify/feature/product_details/widgets/product_title_view.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/styles.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product productModel;
  const ProductDetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: productModel.name??'',),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(crossAxisAlignment : CrossAxisAlignment.start,children: [
          ProductImageView(),
          ProductTitleView(product: productModel,),

          Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('description'.tr,style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge) ),
                Text('${productModel.description}',style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault) ),
              ],
            ),)
        ],),)
      ],),
      bottomNavigationBar: Container(height: 70,child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Row(children: [
          Expanded(child: CustomButton(buttonText: "chat", onPressed: (){},icon: Icons.chat,)),
          const SizedBox(width: Dimensions.paddingSizeDefault,),
          Expanded(child: CustomButton(buttonText: "call", onPressed: (){}, icon: Icons.call,)),
        ],),
      ),),
    );
  }
}
