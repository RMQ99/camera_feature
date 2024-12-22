import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera_app/features/camera/domain/record_video_usecase.dart';
import 'package:camera_app/features/camera/domain/stop_recording_usecase.dart';
import 'package:camera_app/features/camera/domain/capture_photo_usecase.dart';
import 'package:camera_app/features/camera/domain/initialize_camera_usecase.dart';
import 'package:camera_app/features/camera/presentation/pages/camera_screen.dart';
import 'package:camera_app/features/camera/presentation/blocs/camera_event.dart';

import 'core/injection_container.dart' as di;
import 'features/camera/presentation/blocs/camera_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CameraBloc(
            initializeCamera: di.sl<InitializeCameraUseCase>(),
            capturePhoto: di.sl<CapturePhotoUseCase>(),
            recordVideo: di.sl<RecordVideoUseCase>(),
            stopRecording: di.sl<StopRecordingUseCase>(),
          )..add(InitializeCameraEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Camera App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CameraScreen(),
      ),
    );
  }
}






