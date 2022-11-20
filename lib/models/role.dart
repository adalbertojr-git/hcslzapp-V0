class Role {
  String profile;

  Role({
    required this.profile,
  });

  Role.fromJson(Map<String, dynamic> json) : profile = json['profile'];

  Map<String, dynamic> toJson() => {
        'profile': profile,
      };

  @override
  String toString() {
    return 'Role{profile: $profile}';
  }
}
