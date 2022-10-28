class Password {
  int associatedId;
  String aux;

  Password({
    required this.associatedId,
    required this.aux,
  });

  Password.fromJson(Map<String, dynamic> json)
      : associatedId = json['associatedId'],
        aux = json['aux'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['associatedId'] = this.associatedId;
    data['aux'] = this.aux;
    return data;
  }
}
