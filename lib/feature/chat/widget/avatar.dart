import 'package:bikrify/feature/chat/common/styles.dart';
import 'package:bikrify/feature/chat/widget/online_indicator.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  final bool isOnline;

  const Avatar({ Key? key, this.width = 60.0, this.height = 60.0, required this.url, this.isOnline = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height,
      decoration: BoxDecoration(color: background, boxShadow: softShadows, shape: BoxShape.circle,),
      child: Stack(children: <Widget>[
          Container(margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(url)))),
          isOnline ? Positioned(right: 2, bottom: 2,
            child: OnlineIndicator(width: 0.26 * width, height: 0.26 * height,),) : const SizedBox()
        ],
      ),
    );
  }
}
