class Event {
  int id;
  String description;
  String date;

  Event({this.id, this.description, this.date});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['date'] = this.date;
    return data;
  }

  @override
  String toString() {
    return 'Event{id: $id, description: $description, date: $date}';
  }
}