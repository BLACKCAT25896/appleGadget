import 'package:flutter/material.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/images.dart';
import 'package:bikrify/util/styles.dart';


class CartWidgetHomePage extends StatelessWidget {
  const CartWidgetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(onPressed: () {},
        icon: Stack(clipBehavior: Clip.none, children: [
          Image.asset(Images.notificationIcon,
              height: Dimensions.iconSizeMedium,
              width: Dimensions.iconSizeMedium,
              color: Theme.of(context).cardColor),
          Positioned(top: -4, right: -4,
            child: CircleAvatar(radius: 7, backgroundColor: Theme.of(context).colorScheme.error,
              child: Text('0',
                  style: textMedium.copyWith(color: Theme.of(context).cardColor, fontSize: Dimensions.fontSizeExtraSmall,
                  )),
            ),
          ),

        ]),
      ),

        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(onPressed: () {},
            icon: Stack(clipBehavior: Clip.none, children: [
              Image.asset(Images.cartArrowDownImage,
                  height: Dimensions.iconSizeMedium,
                  width: Dimensions.iconSizeMedium,
                  color: Theme.of(context).cardColor),
              Positioned(top: -4, right: -4,
                child: CircleAvatar(radius: 7, backgroundColor: Theme.of(context).colorScheme.error,
                  child: Text("7",
                      style: textMedium.copyWith(color: Theme.of(context).cardColor, fontSize: Dimensions.fontSizeExtraSmall,
                      )),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
