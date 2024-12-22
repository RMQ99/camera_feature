import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera_app/features/camera/presentation/blocs/camera_bloc.dart';
import 'package:camera_app/features/camera/presentation/blocs/camera_state.dart';
import 'package:camera_app/features/camera/domain/stop_recording_usecase.dart';
import 'package:camera_app/features/camera/domain/record_video_usecase.dart';
import 'package:camera_app/features/camera/domain/capture_photo_usecase.dart';
import 'package:camera_app/features/camera/domain/initialize_camera_usecase.dart';
import 'package:camera_app/features/camera/presentation/blocs/camera_event.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraBloc(
        initializeCamera: context.read<InitializeCameraUseCase>(),
        capturePhoto: context.read<CapturePhotoUseCase>(),
        recordVideo: context.read<RecordVideoUseCase>(),
        stopRecording: context.read<StopRecordingUseCase>(),
      )..add(InitializeCameraEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Camera")),
        body: BlocBuilder<CameraBloc, CameraState>(
          builder: (context, state) {
            if (state is CameraLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CameraInitialized) {
              return Column(
                children: [
                  Expanded(
                    child: const Center(
                      child: Text(
                          "Camera is ready!"), // Replace with CameraPreview
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera),
                        onPressed: () {
                          context.read<CameraBloc>().add(CapturePhotoEvent());
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.videocam),
                        onPressed: () {
                          context
                              .read<CameraBloc>()
                              .add(StartVideoRecordingEvent());
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.stop),
                        onPressed: () {
                          context
                              .read<CameraBloc>()
                              .add(StopVideoRecordingEvent());
                        },
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is CameraError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("Initializing Camera..."));
            }
          },
        ),
      ),
    );
  }
}
