import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/controller/localization_controller.dart';
import 'package:flutter_boilerplate/common/controller/theme_controller.dart';
import 'package:flutter_boilerplate/common/widget/custom_image.dart';
import 'package:flutter_boilerplate/common/widget/favourite_button.dart';
import 'package:flutter_boilerplate/feature/home/controller/product_controller.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:get/get.dart';


class ProductImageView extends StatelessWidget {
  ProductImageView({Key? key,}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [



          Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              child: Container(decoration:  BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(color: Get.find<ThemeController>().darkTheme?Theme.of(context).hintColor.withOpacity(.25) : Theme.of(context).primaryColor.withOpacity(.25)),
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
                child: Stack(children: [
                  SizedBox(height: MediaQuery.of(context).size.width,
                    child:PageView.builder(
                      controller: _controller,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius:BorderRadius.circular(Dimensions.paddingSizeSmall),
                          child: CustomImage(height: MediaQuery.of(context).size.width, width: MediaQuery.of(context).size.width,
                              image: ''),
                        );

                      },
                      onPageChanged: (index) {
                        productController.setImageSliderSelectedIndex(index);
                      },
                    ),
                  ),


                  Positioned(left: 0, right: 0, bottom: 10,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(),
                        const Spacer(),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: _indicators(context),
                        ),
                        const Spacer(),



                        Padding(padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault,bottom: Dimensions.paddingSizeDefault),
                          child: Text('${Get.find<ProductController>().imageSliderIndex+1}/10'),
                        ),
                      ],
                    ),
                  ),

                  Positioned(top: 16, right: 16,
                    child: Column(children: [
                        FavouriteButton(
                          backgroundColor: Theme.of(context).cardColor,
                          productId: 2,
                        ),


                          const SizedBox(height: Dimensions.paddingSizeSmall,),
                        Card(elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          child: Container(width: 40, height: 40,
                            decoration: BoxDecoration(color:  Theme.of(context).cardColor , shape: BoxShape.circle),
                            child: Icon(CupertinoIcons.arrow_2_squarepath, color:  Theme.of(context).primaryColor))),
                        const SizedBox(height: Dimensions.paddingSizeSmall,),


                        Card(elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          child: Container(width: 40, height: 40,
                            decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle,),
                            child: Icon(Icons.share, color: Theme.of(context).primaryColor)),
                        )
                      ],
                    ),
                  ),



                ]),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: Get.find<LocalizationController>().isLtr? Dimensions.paddingSizeDefault:0,
              right: Get.find<LocalizationController>().isLtr? 0:Dimensions.paddingSizeDefault, bottom: Dimensions.paddingSizeLarge),
            child: SizedBox(height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    Get.find<ProductController>().setImageSliderSelectedIndex(index);
                    _controller.animateToPage(index, duration: const Duration(microseconds: 50), curve:Curves.ease);
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: index ==  Get.find<ProductController>().imageSliderIndex? 2:0,
                                  color: (index ==  Get.find<ProductController>().imageSliderIndex && Get.find<ThemeController>().darkTheme)? Theme.of(context).primaryColor:
                                  (index ==  Get.find<ProductController>().imageSliderIndex && !Get.find<ThemeController>().darkTheme)?Theme.of(context).primaryColor: Colors.transparent),
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)),
                          child: ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                            child: const CustomImage(height: 50, width: 50,
                                image: ''),
                          ),
                        ),
                      ),
                    ),
                  );

                },),
            ),
          )

        ],);
      }
    );
  }

  List<Widget> _indicators(BuildContext context) {
    List<Widget> indicators = [];
    for (int index = 0; index <10; index++) {
      indicators.add(Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
        child: Container(width: index ==  Get.find<ProductController>().imageSliderIndex? 20 : 6, height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index ==  Get.find<ProductController>().imageSliderIndex ?
            Theme.of(context).primaryColor : Theme.of(context).hintColor,
          ),

        ),
      ));
    }
    return indicators;
  }

}
