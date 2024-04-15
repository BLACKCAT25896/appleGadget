import 'package:bikrify/feature/chat/common/styles.dart';
import 'package:bikrify/feature/chat/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:bikrify/feature/chat/widget/avatar.dart';

class BuildUserAvatar extends StatelessWidget {
  final User user;
  const BuildUserAvatar({Key? key,  required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 6.0),
      child: Column(children: <Widget>[
          Avatar(url: user.imgUrl, isOnline: user.isOnline,),
          const SizedBox(height: 4.0,),
          SizedBox(width: 64.0,
            child: Text(user.name.split(' ')[0], maxLines: 1,
              textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textColor, fontSize: 14.0, fontWeight: FontWeight.w600),),)
        ],
      ),
    );
  }
}
