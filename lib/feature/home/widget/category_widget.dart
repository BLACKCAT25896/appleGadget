import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/category_model.dart';
import 'package:flutter_boilerplate/common/widget/custom_image.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/styles.dart';



class CategoryWidget extends StatelessWidget {
  final CategoryItem category;
  final int index;
  final int length;
  const CategoryWidget({Key? key, required this.category, required this.index, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left :  Dimensions.paddingSizeDefault,
        right: index+1 == length? Dimensions.paddingSizeDefault :  0),
      child: Column( children: [
        Container(height: 70, width: 70,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.125),width: .25),
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
            color: Theme.of(context).primaryColor.withOpacity(.125),
          ),
          child: ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
            child: Image.asset('${category.icon}'))),

        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        Center(child: SizedBox(width: 70,
            child: Text(category.name!, textAlign: TextAlign.center, maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
          ),
        ),

      ]),
    );
  }
}
