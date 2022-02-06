class ErrorResponse {
  final String detail;

  const ErrorResponse({
    required this.detail
    });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      detail: json['detail'] as String,
      );
  }
}
