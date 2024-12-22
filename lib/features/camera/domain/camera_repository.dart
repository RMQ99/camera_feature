abstract class CameraRepository {
  Future<void> initializeCamera();
  Future<void> capturePhoto();
  Future<void> recordVideo();
  Future<void> stopRecording();
}