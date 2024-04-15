import 'package:flutter/material.dart';
import 'package:bikrify/common/model/category_model.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/styles.dart';
import 'package:get/get.dart';

class BottomSheetItemWidget extends StatelessWidget {
  final CategoryItem category;
  final Function()? onTap;
  const BottomSheetItemWidget({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap?? ()=> Get.back(),
      child: Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
        child: Container(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(5)),
          child: Row(children: [
            Image.asset(category.icon!, height: 20),
            const SizedBox(width: Dimensions.paddingSizeSmall,),
            Expanded(child: Text(category.name??'', style: textRegular.copyWith(),)),

            Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).hintColor, size: 15,)
          ],
          ),
        ),
      ),
    );
  }
}
