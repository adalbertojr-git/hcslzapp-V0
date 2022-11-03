class PasswordDTO {
  int associatedId;
  String aux;

  PasswordDTO({
    required this.associatedId,
    required this.aux,
  });

  PasswordDTO.fromJson(Map<String, dynamic> json)
      : associatedId = json['associatedId'],
        aux = json['aux'];

  Map<String, dynamic> toJson() => {
        'associatedId': associatedId,
        'aux': aux,
      };
}
