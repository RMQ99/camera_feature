import '../../domain/entities/photo.dart';

class CameraState {
  final bool isLoading;
  final Camera? camera;
  final String? error;

  CameraState({this.isLoading = false, this.camera, this.error});

  factory CameraState.loading() => CameraState(isLoading: true);

  factory CameraState.success(Camera camera) => CameraState(camera: camera);

  factory CameraState.error(String error) => CameraState(error: error);
}