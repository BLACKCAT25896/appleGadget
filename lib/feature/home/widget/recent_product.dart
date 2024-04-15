
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/title_widget.dart';
import 'package:flutter_boilerplate/feature/home/controller/product_controller.dart';
import 'package:flutter_boilerplate/feature/home/widget/recommendation_item_widget.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:get/get.dart';

class RecentList extends StatelessWidget {
  const RecentList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (productController) {
          return Column(children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                child: TitleWidget(title: 'recent'.tr, onTap: (){},)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
              itemCount:  productController.productList.length,
              itemBuilder: (context, index){
                return Padding(padding: const EdgeInsets.only(right: 10.0, bottom: 5,left: 5),
                    child: RecommendationItem(productModel: productController.productList[index]));
              },
            ),
          ],
          );
        }
    );
  }
}
