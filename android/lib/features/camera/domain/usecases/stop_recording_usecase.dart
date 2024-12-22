import '../../../../core/usecases/usecase.dart';
import '../repositories/camera_repository.dart';

class StopVideoRecordingUseCase implements UseCase<void, NoParams> {
  final CameraRepository repository;

  StopVideoRecordingUseCase(this.repository);

  @override
  Future<void> call(NoParams params) async {
    await repository.stopVideoRecording();
  }
}