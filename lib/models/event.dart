class Event {
  int id;
  String title;
  String date;

  Event({
    required this.id,
    required this.title,
    required this.date,
  });

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        date = json['date'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    return data;
  }

  @override
  String toString() {
    return 'Event:[{id: $id, title: $title, date: $date}]';
  }
}
