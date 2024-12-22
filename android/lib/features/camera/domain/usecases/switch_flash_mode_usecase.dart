import '../../../../core/usecases/usecase.dart';
import '../repositories/camera_repository.dart';

class SwitchFlashModeUseCase implements UseCase<void, bool> {
  final CameraRepository repository;

  SwitchFlashModeUseCase(this.repository);

  @override
  Future<void> call(bool isOn) async {
    await repository.switchFlashMode(isOn);
  }
}