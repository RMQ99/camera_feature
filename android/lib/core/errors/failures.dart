abstract class Failure {
  final String message;

  Failure(this.message);
}

class CameraFailure extends Failure {
  CameraFailure(String message) : super(message);
}