import 'package:equatable/equatable.dart';

abstract class CameraState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CameraInitial extends CameraState {}

class CameraLoading extends CameraState {}

class CameraInitialized extends CameraState {}

class PhotoCaptured extends CameraState {}

class VideoRecording extends CameraState {}

class VideoStopped extends CameraState {}

class CameraError extends CameraState {
  final String message;

  CameraError(this.message);

  @override
  List<Object?> get props => [message];
}