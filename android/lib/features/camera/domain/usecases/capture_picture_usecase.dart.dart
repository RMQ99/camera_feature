import '../../../../core/usecases/usecase.dart';
import '../entities/photo.dart';
import '../repositories/camera_repository.dart';

class CapturePictureUseCase implements UseCase<Camera, NoParams> {
  final CameraRepository repository;

  CapturePictureUseCase(this.repository);

  @override
  Future<Camera> call(NoParams params) async {
    String imagePath = await repository.capturePicture();
    return Camera(imagePath: imagePath);
  }
}