import 'package:camera_app/features/camera/domain/camera_repository.dart';

class RecordVideoUseCase {
  final CameraRepository repository;

  RecordVideoUseCase(this.repository);

  Future<void> call() async => await repository.recordVideo();
}
