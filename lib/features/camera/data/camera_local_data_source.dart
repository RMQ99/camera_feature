import 'package:camera/camera.dart';

class CameraLocalDataSource {
  CameraController? _controller;

  Future<CameraController> initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras.first, ResolutionPreset.high);
    await _controller!.initialize();
    return _controller!;
  }

  Future<void> capturePhoto() async {
    if (_controller == null) throw Exception("Camera not initialized.");
    await _controller!.takePicture();
  }

  Future<void> recordVideo() async {
    if (_controller == null) throw Exception("Camera not initialized.");
    await _controller!.startVideoRecording();
  }

  Future<void> stopRecording() async {
    if (_controller == null) throw Exception("Camera not initialized.");
    await _controller!.stopVideoRecording();
  }

  void dispose() {
    _controller?.dispose();
  }
}
