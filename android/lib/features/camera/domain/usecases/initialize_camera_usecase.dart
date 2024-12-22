import '../../../../core/usecases/usecase.dart';
import '../repositories/camera_repository.dart';

class InitializeCameraUseCase implements UseCase<void, NoParams> {
  final CameraRepository repository;

  InitializeCameraUseCase(this.repository);

  @override
  Future<void> call(NoParams params) async {
    await repository.initializeCamera();
  }
}