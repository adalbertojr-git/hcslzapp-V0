class ApiErrors {
  final String errors;
  final String status;

  ApiErrors({
    required this.errors,
    required this.status,
  });

  ApiErrors.fromJson(Map<String, dynamic> json)
      : errors = json['errors'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'errors': errors,
        'status': status,
      };

  @override
  String toString() {
    return 'ApiErrors{errors: $errors, status: $status}';
  }
}
