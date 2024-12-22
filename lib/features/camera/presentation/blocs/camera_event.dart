import 'package:equatable/equatable.dart';

abstract class CameraEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeCameraEvent extends CameraEvent {}

class CapturePhotoEvent extends CameraEvent {}

class StartVideoRecordingEvent extends CameraEvent {}

class StopVideoRecordingEvent extends CameraEvent {}