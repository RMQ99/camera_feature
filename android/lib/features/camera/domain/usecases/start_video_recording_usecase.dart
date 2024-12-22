import '../../../../core/usecases/usecase.dart';
import '../repositories/camera_repository.dart';

class StartVideoRecordingUseCase implements UseCase<void, NoParams> {
  final CameraRepository repository;

  StartVideoRecordingUseCase(this.repository);

  @override
  Future<void> call(NoParams params) async {
    await repository.startVideoRecording();
  }
}