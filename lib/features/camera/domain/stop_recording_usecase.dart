import 'package:camera_app/features/camera/domain/camera_repository.dart';

class StopRecordingUseCase {
  final CameraRepository repository;

  StopRecordingUseCase(this.repository);

  Future<void> call() async => await repository.stopRecording();
}
