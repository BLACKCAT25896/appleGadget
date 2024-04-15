import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/favorite/widgets/favorite_item.dart';
import 'package:flutter_boilerplate/feature/home/controller/product_controller.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:get/get.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (productController) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
            itemCount:  productController.productList.length,
            itemBuilder: (context, index){
              return Padding(padding: const EdgeInsets.only(right: 10.0, bottom: 5,left: 5),
                  child: FavoriteItem(productModel: productController.productList[index]));
            },
          );
        }
    );
  }
}
