class Role {
  int id;
  String profile;

  Role({
    required this.id,
    required this.profile,
  });

  Role.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        profile = json['profile'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'profile': profile,
      };

  @override
  String toString() {
    return 'Role{id: $id, profile: $profile}';
  }
}
