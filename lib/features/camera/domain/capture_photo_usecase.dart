import 'package:camera_app/features/camera/domain/camera_repository.dart';

class CapturePhotoUseCase {
  final CameraRepository repository;

  CapturePhotoUseCase(this.repository);

  Future<void> call() async => await repository.capturePhoto();
}
