import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/photo.dart';
import '../../domain/usecases/capture_picture_usecase.dart.dart';
import '../../domain/usecases/flip_camera_usecase.dart';
import '../../domain/usecases/initialize_camera_usecase.dart';
import '../../domain/usecases/start_video_recording_usecase.dart';
import '../../domain/usecases/stop_recording_usecase.dart';
import '../../domain/usecases/switch_flash_mode_usecase.dart';
import 'camera_event.dart';
import 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CapturePictureUseCase capturePictureUseCase;
  final StartVideoRecordingUseCase startVideoRecordingUseCase;
  final StopVideoRecordingUseCase stopVideoRecordingUseCase;
  final InitializeCameraUseCase initializeCameraUseCase;
  final SwitchFlashModeUseCase switchFlashModeUseCase;
  final FlipCameraUseCase flipCameraUseCase;

  CameraBloc({
    required this.capturePictureUseCase,
    required this.startVideoRecordingUseCase,
    required this.stopVideoRecordingUseCase,
    required this.initializeCameraUseCase,
    required this.switchFlashModeUseCase,
    required this.flipCameraUseCase,
  }) : super(CameraState()) {
    on<CameraEvent>((event, emit) async {
      switch (event) {
        case CameraEvent.initialize:
          emit(CameraState.loading());
          try {
            await initializeCameraUseCase(NoParams());
            emit(CameraState.success(Camera()));
          } catch (e) {
            emit(CameraState.error(e.toString()));
          }
          break;
        case CameraEvent.capturePicture:
          emit(CameraState.loading());
          try {
            String imagePath = (await capturePictureUseCase(NoParams())) as String;
            emit(CameraState.success(Camera(imagePath: imagePath)));
          } catch (e) {
            emit(CameraState.error(e.toString()));
          }
          break;
        case CameraEvent.startVideoRecording:
          emit(CameraState.loading());
          try {
            await startVideoRecordingUseCase(NoParams());
            emit(CameraState.success(Camera(isRecording: true)));
          } catch (e) {
            emit(CameraState.error(e.toString()));
          }
          break;
        case CameraEvent.stopVideoRecording:
          emit(CameraState.loading());
          try {
            await stopVideoRecordingUseCase(NoParams());
            emit(CameraState.success(Camera(isRecording: false)));
          } catch (e) {
            emit(CameraState.error(e.toString()));
          }
          break;
        case CameraEvent.switchFlashMode:
          emit(CameraState.loading());
          try {
            bool newFlashMode = !(state.camera?.flashOn ?? false);
            await switchFlashModeUseCase(newFlashMode);
            emit(CameraState.success(state.camera!.copyWith(flashOn: newFlashMode)));
          } catch (e) {
            emit(CameraState.error(e.toString()));
          }
          break;
        case CameraEvent.flipCamera:
          emit(CameraState.loading());
          try {
            bool useFrontCamera = !(state.camera?.isFrontCamera ?? true);
            await flipCameraUseCase(useFrontCamera);
            emit(CameraState.success(state.camera!.copyWith(isFrontCamera: useFrontCamera)));
          } catch (e) {
            emit(CameraState.error(e.toString()));
          }
          break;
      }
    });
  }
}