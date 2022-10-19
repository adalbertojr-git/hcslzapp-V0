class DtcCode {
  int id;
  String code;
  String description;

  DtcCode({
    required this.id,
    required this.code,
    required this.description,
  });

  DtcCode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        code = json['code'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}
