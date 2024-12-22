class PhotoModel {
  final String filePath;
  final DateTime timestamp;

  PhotoModel({required this.filePath, required this.timestamp});

  Map<String, dynamic> toJson() {
    return {
      'filePath': filePath,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}