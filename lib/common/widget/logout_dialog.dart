import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/styles.dart';


class CustomDialog extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final IconData icon;
  final String title;
  final String description;
  final Function onTapTrue;
  final String? onTapTrueText;
  final Function onTapFalse;
  final String? onTapFalseText;
  final bool bigTitle;
  const CustomDialog({Key? key, 
    this.isFailed = false,
    this.rotateAngle = 0,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTapFalse,
    required this.onTapTrue,
    this.onTapTrueText,
    this.onTapFalseText,
    this.bigTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Stack(clipBehavior: Clip.none, children: [

          Positioned(
            left: 0, right: 0, top: -55,
            child: Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: isFailed ? Theme.of(context).colorScheme.error.withOpacity(0.7) : Theme.of(context).primaryColor, shape: BoxShape.circle),
              child: Transform.rotate(angle: rotateAngle, child: Icon(icon, size: 40, color: Colors.white)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              bigTitle ? FittedBox(child: Text(title, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start))
                  : Text(title, style: textRegular.copyWith(fontSize: bigTitle ? Dimensions.paddingSizeSmall :  Dimensions.fontSizeLarge), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Text(description, textAlign: TextAlign.center, style: textRegular),
              const SizedBox(height: Dimensions.paddingSizeLarge),

           const SizedBox(),
            ]),
          ),

        ]),
      ),
    );
  }
}
