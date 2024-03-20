class ApiErrorResponse {
  ApiErrorResponse({
    required this.message,
    this.name,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      name: json['name'] as String?,
      message: json['message'] as String,
    );
  }
  final String? name;
  final String message;
}
