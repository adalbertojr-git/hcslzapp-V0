class Event {
  int id;
  String title;
  String initialDate;
  String endDate;
  String date;
  String description;
  String photoUrl;
  int idEventReference;

  Event({
    required this.id,
    required this.title,
    required this.initialDate,
    required this.endDate,
    required this.date,
    required this.description,
    required this.photoUrl,
    required this.idEventReference,
  });

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        initialDate = json['initialDate'],
        endDate = json['endDate'],
        date = json['date'],
        description = json['description'],
        photoUrl = json['photoUrl'],
        idEventReference = json['idEventReference'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['initialDate'] = this.initialDate;
    data['endDate'] = this.endDate;
    data['date'] = this.date;
    data['description'] = this.description;
    data['photoUrl'] = this.photoUrl;
    data['idEventReference'] = this.idEventReference;
    return data;
  }

  @override
  String toString() {
    return 'Event:[{id: $id, title: $title, initialDate: $initialDate, '
        'endDate: $endDate, date: $date, description: $description, '
        'photoUrl: $idEventReference, photoUrl: $idEventReference}]';
  }
}
