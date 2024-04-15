import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bikrify/util/dimensions.dart';


class FavouriteButton extends StatelessWidget {
  final Color backgroundColor;
  final int? productId;
  final bool isFavorite;
  const FavouriteButton({Key? key, this.backgroundColor = Colors.black, this.productId,  this.isFavorite = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Container(width: 40, height: 40,
        decoration: BoxDecoration(color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.125), spreadRadius: 1, blurRadius: 1, offset: const Offset(0,0))]),
        child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Icon( isFavorite? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color:isFavorite? Colors.red: Theme.of(context).primaryColor, size: 25)),
      );
  }
}
