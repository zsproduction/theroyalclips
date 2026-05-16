import 'video_model.dart';

class FeedService {
  Future<List<VideoModel>> getVideos() async {
    List<Map<String, dynamic>> dummy = [
      {
        'id': '1',
        'videoUrl': 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
        'caption': 'First Clip',
        'likes': 10,
        'views': 100
      },
      {
        'id': '2',
        'videoUrl': 'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
        'caption': 'Second Clip',
        'likes': 50,
        'views': 300
      }
    ];

    List<VideoModel> videos = dummy.map((e) {
      return VideoModel.fromMap(e['id'], e);
    }).toList();

    videos.sort((a, b) => (b.likes + b.views).compareTo(a.likes + a.views));

    return videos;
  }
}