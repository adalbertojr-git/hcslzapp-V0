class Event {
  int id;
  String title;
  String date;
  String description;
  String photoUrl;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.photoUrl,
  });

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        date = json['date'],
        description = json['description'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['description'] = this.description;
    data['photoUrl'] = this.photoUrl;
    return data;
  }

  @override
  String toString() {
    return 'Event:[{id: $id, title: $title, date: $date, description: $description, photoUrl: $photoUrl}]';
  }
}
