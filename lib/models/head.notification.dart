class HeadNotification {
  final int id;
  String title;
  String notification;

  HeadNotification({
    required this.id,
    required this.title,
    required this.notification,
  });

  HeadNotification.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        notification = json['notification'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'notification': notification,
      };

  @override
  String toString() {
    return 'HeadNotification{id: $id, title: $title, notification: $notification}';
  }
}
