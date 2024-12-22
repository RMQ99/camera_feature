class CameraException implements Exception {
  final String message;

  CameraException(this.message);

  @override
  String toString() => "CameraException: $message";
}