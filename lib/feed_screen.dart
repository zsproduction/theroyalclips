import 'package:flutter/material.dart';
import 'feed_service.dart';
import 'video_model.dart';
import 'video_widget.dart';

class FeedScreen extends StatefulWidget {
  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedService service = FeedService();
  late Future<List<VideoModel>> videos;

  @override
  void initState() {
    super.initState();
    videos = service.getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: videos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data as List<VideoModel>;

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return VideoWidget(video: data[index]);
            },
          );
        },
      ),
    );
  }
}