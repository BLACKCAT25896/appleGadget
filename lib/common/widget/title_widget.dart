import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TitleWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final bool? isDetailsPage;
  const TitleWidget({Key? key, required this.title, this.onTap, this.isDetailsPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title!, style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
          onTap != null ?
          InkWell(onTap: onTap,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              isDetailsPage == null ?
              Text('view_all'.tr, style: textRegular.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: Dimensions.fontSizeSmall)) : const SizedBox.shrink(),
              Padding(padding: const EdgeInsets.only(left : Dimensions.paddingSizeSmall),
                child: Icon(Icons.arrow_forward_ios, color: isDetailsPage == null ?
                    Theme.of(context).primaryColor : Theme.of(context).hintColor,
                    size: Dimensions.fontSizeSmall),
                ),
              ]),
            ) : const SizedBox.shrink(),
        ]);
  }
}

