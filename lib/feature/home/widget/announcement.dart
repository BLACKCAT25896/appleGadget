import 'package:flutter/material.dart';
import 'package:bikrify/feature/home/model/announcement.dart';
import 'package:bikrify/feature/home/widget/marque_text.dart';
import 'package:bikrify/util/dimensions.dart';



class AnnouncementScreen extends StatelessWidget {
  final Announcement? announcement;
  const AnnouncementScreen({Key? key, this.announcement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String color = announcement!.color!.replaceAll('#', '0xff');
    String textColor = announcement!.textColor!.replaceAll('#', '0xff');
    return Container(decoration: BoxDecoration(
      color: Color(int.parse(color))),
        child: Row(children: [
          Expanded(child: MarqueeWidget(direction: Axis.horizontal,
              child: Padding(padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                  child: Text(announcement!.announcement!, style: TextStyle(color: Color(int.parse(textColor))))))),
            Container( width: 40, padding: const EdgeInsets.all(10),
              child: Center(child: InkWell(onTap: (){
                      //Provider.of<SplashProvider>(context,listen: false).changeAnnouncementOnOff(false);
                    },
                    child: Icon(Icons.clear, color: Color(int.parse(textColor)))),
              ),
            ),
          ],
        ));
  }
}
