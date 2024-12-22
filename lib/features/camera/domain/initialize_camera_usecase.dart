import 'package:camera_app/features/camera/domain/camera_repository.dart';

class InitializeCameraUseCase {
  final CameraRepository repository;

  InitializeCameraUseCase(this.repository);

  Future<void> call() async => await repository.initializeCamera();
}
