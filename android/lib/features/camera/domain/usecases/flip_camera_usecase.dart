import '../../../../core/usecases/usecase.dart';
import '../repositories/camera_repository.dart';

class FlipCameraUseCase implements UseCase<void, bool> {
  final CameraRepository repository;

  FlipCameraUseCase(this.repository);

  @override
  Future<void> call(bool useFrontCamera) async {
    await repository.flipCamera(useFrontCamera);
  }
}