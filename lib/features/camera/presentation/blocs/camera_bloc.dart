import 'package:flutter_bloc/flutter_bloc.dart';
import 'camera_event.dart';
import 'camera_state.dart';
import 'package:camera_app/features/camera/domain/initialize_camera_usecase.dart';
import 'package:camera_app/features/camera/domain/capture_photo_usecase.dart';
import 'package:camera_app/features/camera/domain/record_video_usecase.dart';
import 'package:camera_app/features/camera/domain/stop_recording_usecase.dart';
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final InitializeCameraUseCase initializeCamera;
  final CapturePhotoUseCase capturePhoto;
  final RecordVideoUseCase recordVideo;
  final StopRecordingUseCase stopRecording;

  CameraBloc({
    required this.initializeCamera,
    required this.capturePhoto,
    required this.recordVideo,
    required this.stopRecording,
  }) : super(CameraInitial()) {
    on<InitializeCameraEvent>(_onInitializeCamera);
    on<CapturePhotoEvent>(_onCapturePhoto);
    on<StartVideoRecordingEvent>(_onStartVideoRecording);
    on<StopVideoRecordingEvent>(_onStopVideoRecording);
  }

  Future<void> _onInitializeCamera(
      InitializeCameraEvent event, Emitter<CameraState> emit) async {
    emit(CameraLoading());
    try {
      await initializeCamera();
      emit(CameraInitialized());
    } catch (e) {
      emit(CameraError("Failed to initialize the camera."));
    }
  }

  Future<void> _onCapturePhoto(
      CapturePhotoEvent event, Emitter<CameraState> emit) async {
    try {
      await capturePhoto();
      emit(PhotoCaptured());
    } catch (e) {
      emit(CameraError("Failed to capture photo."));
    }
  }

  Future<void> _onStartVideoRecording(
      StartVideoRecordingEvent event, Emitter<CameraState> emit) async {
    try {
      await recordVideo();
      emit(VideoRecording());
    } catch (e) {
      emit(CameraError("Failed to start video recording."));
    }
  }

  Future<void> _onStopVideoRecording(
      StopVideoRecordingEvent event, Emitter<CameraState> emit) async {
    try {
      await stopRecording();
      emit(VideoStopped());
    } catch (e) {
      emit(CameraError("Failed to stop video recording."));
    }
  }
}