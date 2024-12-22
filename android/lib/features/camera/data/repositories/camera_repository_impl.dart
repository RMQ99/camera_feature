import 'dart:async';
import '../../domain/repositories/camera_repository.dart';

import '../datasources/camera_local_data_source.dart';

class CameraRepositoryImpl implements CameraRepository {
  final CameraDataSource dataSource;

  CameraRepositoryImpl(this.dataSource);

  @override
  Future<void> initializeCamera() async {
    await dataSource.initializeCamera();
  }

  @override
  Future<String> capturePicture() async {
    return await dataSource.capturePicture();
  }

  @override
  Future<void> startVideoRecording() async {
    await dataSource.startVideoRecording();
  }

  @override
  Future<void> stopVideoRecording() async {
    await dataSource.stopVideoRecording();
  }

  @override
  Future<void> switchFlashMode(bool isOn) async {
    await dataSource.switchFlashMode(isOn);
  }

  @override
  Future<void> flipCamera(bool useFrontCamera) async {
    await dataSource.flipCamera(useFrontCamera);
  }


}