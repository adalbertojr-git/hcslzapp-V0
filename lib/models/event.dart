class Event {
  int id;
  String title;
  String initialDate;
  String endDate;
  String description;
  String photoUrl;

  Event({
    required this.id,
    required this.title,
    required this.initialDate,
    required this.endDate,
    required this.description,
    required this.photoUrl,
  });

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        initialDate = json['initialDate'],
        endDate = json['endDate'],
        description = json['description'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['initialDate'] = this.initialDate;
    data['endDate'] = this.endDate;
    data['description'] = this.description;
    data['photoUrl'] = this.photoUrl;
    return data;
  }

  @override
  String toString() {
    return 'Event:[{id: $id, title: $title, initialDate: $initialDate, '
        'endDate: $endDate, description: $description, photoUrl: $photoUrl}]';
  }
}
