
import 'package:flutter/material.dart';
import 'package:bikrify/feature/chat/common/styles.dart';
import 'package:bikrify/feature/chat/chat_screen.dart';
import 'package:bikrify/feature/chat/model/message.dart';
import 'package:bikrify/feature/chat/widget/avatar.dart';

class BuildRecentChat extends StatelessWidget {
  final Message message;
  const BuildRecentChat({Key? key, required this.message, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ()  =>Navigator.push(context, MaterialPageRoute(builder: (_) => EcommerceChatScreen(sender: message.sender))),
      child: Padding(padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(children: [
            Avatar(url: message.sender.imgUrl, isOnline: message.sender.isOnline,),
            const SizedBox(width: 8.0),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(message.sender.name, style: TextStyle(color: textColor, fontSize: 16.0, fontWeight: FontWeight.w600),),

              const SizedBox(height: 2.0),
              Text(message.content, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: message.hasRead ? textColor.withOpacity(.4) : textColor, fontSize: 14.0, fontWeight: FontWeight.w400))],)),

            const SizedBox(width: 8.0),
            Text('${formatTime('0${message.time.hour}')}:${formatTime('0${message.time.minute}')}',
              style: TextStyle(color: textColor.withOpacity(.6), fontSize: 14.0))
          ],
        ),
      ),
    );
  }
  String formatTime(String time) {
    return time.substring(time.length - 2);
  }
}
