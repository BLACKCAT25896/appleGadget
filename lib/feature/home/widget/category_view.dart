import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/category_model.dart';
import 'package:flutter_boilerplate/common/widget/title_widget.dart';
import 'package:flutter_boilerplate/feature/home/widget/category_widget.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:get/get.dart';


class CategoryView extends StatelessWidget {
  final bool isHomePage;
  const CategoryView({Key? key, required this.isHomePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeDefault),
            child: TitleWidget(title: 'browse_categories'.tr, onTap: (){},)),
        SizedBox( height: 120,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return CategoryWidget(category: categories[index], index: index,length:  categories.length);

            },
          ),
        ),
      ],
    );
  }
}



