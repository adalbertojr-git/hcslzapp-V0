class HeadNotification {
  final int id;
  String title;
  String notification;
  String datePublication;

  HeadNotification(
      {required this.id,
      required this.title,
      required this.notification,
      required this.datePublication});

  HeadNotification.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        notification = json['notification'],
        datePublication = json['datePublication'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'notification': notification,
        'datePublication': datePublication,
      };

  @override
  String toString() {
    return 'HeadNotification{id: $id, title: $title, notification: $notification, datePublication: $datePublication}';
  }
}
