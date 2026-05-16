class VideoModel {
  final String id;
  final String videoUrl;
  final String caption;
  final int likes;
  final int views;

  VideoModel({
    required this.id,
    required this.videoUrl,
    required this.caption,
    required this.likes,
    required this.views,
  });

  factory VideoModel.fromMap(String id, Map data) {
    return VideoModel(
      id: id,
      videoUrl: data['videoUrl'] ?? '',
      caption: data['caption'] ?? '',
      likes: data['likes'] ?? 0,
      views: data['views'] ?? 0,
    );
  }
}