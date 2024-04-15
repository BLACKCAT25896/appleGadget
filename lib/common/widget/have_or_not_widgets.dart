import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



class HaveOrNotWidget extends StatelessWidget {
  final String text;
  final String btnText;
  final VoidCallback? onTap;
  final Color? descColor;

  const HaveOrNotWidget(
      {Key? key,
      required this.text,
      required this.btnText,
      required this.onTap,
      this.descColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: text,

        children: [
          TextSpan(
              text: " $btnText ",

              recognizer: TapGestureRecognizer()..onTap = onTap)
        ]));
  }
}
