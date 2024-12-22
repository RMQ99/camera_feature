import 'package:get_it/get_it.dart';
import '../features/camera/data/datasources/camera_local_data_source.dart';
import '../features/camera/data/repositories/camera_repository_impl.dart';
import '../features/camera/domain/repositories/camera_repository.dart';
import '../features/camera/domain/usecases/capture_picture_usecase.dart.dart';
import '../features/camera/domain/usecases/flip_camera_usecase.dart';
import '../features/camera/domain/usecases/initialize_camera_usecase.dart';
import '../features/camera/domain/usecases/start_video_recording_usecase.dart';
import '../features/camera/domain/usecases/stop_recording_usecase.dart';
import '../features/camera/domain/usecases/switch_flash_mode_usecase.dart';
import '../features/camera/presentation/blocs/camera_bloc.dart';


final GetIt sl = GetIt.instance;

void setup() {

  sl.registerLazySingleton<CameraRepository>(() => CameraRepositoryImpl(sl<CameraDataSource>()));

  sl.registerLazySingleton(() => CapturePictureUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => StartVideoRecordingUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => StopVideoRecordingUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => InitializeCameraUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => SwitchFlashModeUseCase(sl<CameraRepository>()));
  sl.registerLazySingleton(() => FlipCameraUseCase(sl<CameraRepository>()));

  sl.registerFactory(() => CameraBloc(
    capturePictureUseCase: sl<CapturePictureUseCase>(),
    startVideoRecordingUseCase: sl<StartVideoRecordingUseCase>(),
    stopVideoRecordingUseCase: sl<StopVideoRecordingUseCase>(),
    initializeCameraUseCase: sl<InitializeCameraUseCase>(),
    switchFlashModeUseCase: sl<SwitchFlashModeUseCase>(),
    flipCameraUseCase: sl<FlipCameraUseCase>(),
  ));
}