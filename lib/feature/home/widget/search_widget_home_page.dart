import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:get/get.dart';


class SearchWidgetHomePage extends StatelessWidget {
  const SearchWidgetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
      child: Container(padding:  const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeSmall),

        alignment: Alignment.center,
        child: Container(padding: const EdgeInsets.only(
          left: Dimensions.paddingSizeDefault, right: Dimensions.paddingSizeExtraSmall),
          height: 60, alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Theme.of(context).cardColor,
            boxShadow:  [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.1), spreadRadius: 1, blurRadius: 1, offset: const Offset(0,0))],
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
          child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [

            Text('search_hint'.tr, style: textRegular.copyWith(color: Theme.of(context).hintColor)),

            Container(width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall))),
              child: Icon(Icons.search, color:  Theme.of(context).cardColor, size: Dimensions.iconSizeSmall),
            ),
          ]),
        ),
      ),
    );
  }
}
