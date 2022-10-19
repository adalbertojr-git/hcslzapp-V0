import 'role.dart';

class Authenticate {
  int id;
  String username;
  List<Role> roles;

  Authenticate({
    required this.id,
    required this.username,
    required this.roles,
  });

  Authenticate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        roles = List.from(
            (json['roles'] as List).map((roles) => Role.fromJson(roles)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'roles': List<dynamic>.from(roles.map((roles) => roles.toJson())),
      };

  @override
  String toString() {
    return 'Authenticate{id: $id, username: $username, roles: $roles}';
  }
}
