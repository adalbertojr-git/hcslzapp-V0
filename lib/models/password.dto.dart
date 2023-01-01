class PasswordDTO {
  int associatedId;
  String psw;
  String aux;

  PasswordDTO({
    required this.associatedId,
    required this.psw,
    required this.aux,
  });

  PasswordDTO.fromJson(Map<String, dynamic> json)
      : associatedId = json['associatedId'],
        psw = json['psw'],
        aux = json['aux'];

  Map<String, dynamic> toJson() => {
        'associatedId': associatedId,
        'psw': psw,
        'aux': aux,
      };
}
