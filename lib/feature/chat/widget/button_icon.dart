import 'package:bikrify/feature/chat/common/styles.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final double borderRadius;
  final Function()? action;

  const ButtonIcon({Key? key, required this.icon, this.borderRadius = 8.0,  this.action}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(boxShadow: softShadows, color: background, borderRadius: BorderRadius.circular(borderRadius)),
          child: Icon(icon, size: 18.0, color: Theme.of(context).primaryColor,)),
    );
  }
}
