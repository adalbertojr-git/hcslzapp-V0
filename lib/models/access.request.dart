class AccessRequest {
  int id;
  String name;
  String user;
  String email;
  String password;

  AccessRequest({this.id, this.name, this.user, this.email, this.password});

  AccessRequest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        user = json['user'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'user': user,
        'email': email,
        'password': password,
      };

  @override
  String toString() {
    return 'AccessRequest{id: $id, '
        'name: $name, '
        'user: $user, '
        'email: $email, '
        'password: $password}';
  }
}
