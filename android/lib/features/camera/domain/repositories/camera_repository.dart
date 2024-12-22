abstract class CameraRepository {
  Future<void> initializeCamera();
  Future<String> capturePicture();
  Future<void> startVideoRecording();
  Future<void> stopVideoRecording();
  Future<void> switchFlashMode(bool isOn);
  Future<void> flipCamera(bool useFrontCamera);
}