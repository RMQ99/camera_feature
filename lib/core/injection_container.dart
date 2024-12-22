import 'package:camera_app/features/camera/data/camera_local_data_source.dart';
import 'package:camera_app/features/camera/data/camera_repository_impl.dart';
import 'package:camera_app/features/camera/domain/camera_repository.dart';
import 'package:camera_app/features/camera/domain/capture_photo_usecase.dart';
import 'package:camera_app/features/camera/domain/initialize_camera_usecase.dart';
import 'package:camera_app/features/camera/domain/record_video_usecase.dart';
import 'package:camera_app/features/camera/domain/stop_recording_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data Layer
  sl.registerLazySingleton<CameraLocalDataSource>(
      () => CameraLocalDataSource());

  // Repository
  sl.registerLazySingleton<CameraRepository>(
    () => CameraRepositoryImpl(localDataSource: sl<CameraLocalDataSource>()),
  );

  // Use Cases
  sl.registerLazySingleton(
      () => InitializeCameraUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => CapturePhotoUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => RecordVideoUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => StopRecordingUseCase(sl<CameraRepository>()));
}
