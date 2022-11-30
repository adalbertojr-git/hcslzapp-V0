class Partnership {
  int id;
  String partner;
  String phone1;
  String phone2;
  String address;
  String promotion;
  String status;
  String photoUrl;

  Partnership({
    required this.id,
    required this.partner,
    required this.phone1,
    required this.phone2,
    required this.address,
    required this.promotion,
    required this.status,
    required this.photoUrl,
  });

  Partnership.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        partner = json['partner'],
        phone1 = json['phone1'],
        phone2 = json['phone2'],
        address = json["address"],
        promotion = json["promotion"],
        status = json['status'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'partner': partner,
        'phone1': phone1,
        'phone2': phone2,
        'address': address,
        'promotion': promotion,
        'status': status,
        'photoUrl': photoUrl,
      };

  @override
  String toString() {
    return 'Partnership{id: $id, partner: $partner, phone1: $phone1, phone2: $phone2, '
        'address: $address, promotion: promotion, status: $status, photoUrl: $photoUrl}';
  }
}
