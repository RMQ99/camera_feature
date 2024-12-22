class CameraModel {
  final String imagePath;
  final bool isRecording;
  final bool flashOn;
  final bool isFrontCamera;

  CameraModel({
    this.imagePath = '',
    this.isRecording = false,
    this.flashOn = false,
    this.isFrontCamera = true,
  });

  factory CameraModel.fromJson(Map<String, dynamic> json) {
    return CameraModel(
      imagePath: json['imagePath'],
      isRecording: json['isRecording'],
      flashOn: json['flashOn'],
      isFrontCamera: json['isFrontCamera'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'isRecording': isRecording,
      'flashOn': flashOn,
      'isFrontCamera': isFrontCamera,
    };
  }
}