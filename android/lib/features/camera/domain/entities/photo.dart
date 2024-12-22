class Camera {
  final String imagePath;
  final bool isRecording;
  final bool flashOn;
  final bool isFrontCamera;

  Camera({
    this.imagePath = '',
    this.isRecording = false,
    this.flashOn = false,
    this.isFrontCamera = true,
  });

  Camera copyWith({
    String? imagePath,
    bool? isRecording,
    bool? flashOn,
    bool? isFrontCamera,
  }) {
    return Camera(
      imagePath: imagePath ?? this.imagePath,
      isRecording: isRecording ?? this.isRecording,
      flashOn: flashOn ?? this.flashOn,
      isFrontCamera: isFrontCamera ?? this.isFrontCamera,
    );
  }
}