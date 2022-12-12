class HeadNotification {
  int id;
  String title;
  String notification;
  String datePublication;
  String photoUrl;

  HeadNotification({
    required this.id,
    required this.title,
    required this.notification,
    required this.datePublication,
    required this.photoUrl,
  });

  HeadNotification.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        notification = json['notification'],
        datePublication = json['datePublication'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'notification': notification,
        'datePublication': datePublication,
        'photoUrl': photoUrl,
      };

  @override
  String toString() {
    return 'HeadNotification{id: $id, title: $title, notification: $notification, '
        'datePublication: $datePublication,  photoUrl: $photoUrl}';
  }
}
