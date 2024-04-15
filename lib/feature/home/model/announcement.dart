class Announcement {
  String? status;
  String? color;
  String? textColor;
  String? announcement;

  Announcement({this.status, this.color, this.textColor, this.announcement});

  Announcement.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    color = json['color'];
    textColor = json['text_color'];
    announcement = json['announcement'];
  }

}

Announcement announcement = Announcement(announcement: "Get 50% discount for specific products from June 2024 to December2024.",
status: "1",
color: "#ebebeb",
textColor: "#000000",
);