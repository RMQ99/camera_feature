import 'package:camera_app/features/camera/data/camera_local_data_source.dart';
import 'package:camera_app/features/camera/domain/camera_repository.dart';

class CameraRepositoryImpl implements CameraRepository {
  final CameraLocalDataSource localDataSource;

  CameraRepositoryImpl({required this.localDataSource});

  @override
  Future<void> initializeCamera() => localDataSource.initializeCamera();

  @override
  Future<void> capturePhoto() => localDataSource.capturePhoto();

  @override
  Future<void> recordVideo() => localDataSource.recordVideo();

  @override
  Future<void> stopRecording() => localDataSource.stopRecording();
}
