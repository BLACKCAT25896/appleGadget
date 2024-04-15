
import 'package:flutter/material.dart';
import 'package:bikrify/common/widget/app_bar_widget.dart';
import 'package:bikrify/feature/chat/common/styles.dart';
import 'package:bikrify/feature/chat/model/message.dart';
import 'package:bikrify/feature/chat/model/user_model.dart';
import 'package:bikrify/feature/chat/widget/build_recent_chat.dart';
import 'package:bikrify/feature/chat/widget/build_user_avatar.dart';
import 'package:get/get.dart';



class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "inbox".tr, regularAppbar: true, showBackButton: false,),
      body: Column(children: [

        Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Container(padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(color: background, boxShadow: softShadowsInvert,
                borderRadius: BorderRadius.circular(30.0)),
            child: Row(children: <Widget>[
                Container(padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(boxShadow: softShadows, color: background, shape: BoxShape.circle),
                    child: Icon(Icons.search, size: 16.0, color: Theme.of(context).primaryColor,)),
                const SizedBox(width: 12.0),


                Expanded(child: TextField(
                    style: TextStyle(color: textColor, fontSize: 16.0),
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle:
                        TextStyle(color: textColor.withOpacity(0.6)),
                        filled: false,
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 12.0)))),
              ],
            ),
          ),
        ),
        // List User
        SizedBox(height: 100.0,
          child: Center(
            child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: favoriteUsers.length,
                itemBuilder: (BuildContext ctx, int index) => BuildUserAvatar(user : favoriteUsers[index])))),

        // recents
        Expanded(child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          itemCount: recentChats.length,
          itemBuilder: (BuildContext ctx, int index) => BuildRecentChat(message : recentChats[index]),)),


      ]),
    );
  }

}


