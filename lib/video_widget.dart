import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_model.dart';

class VideoWidget extends StatefulWidget {
  final VideoModel video;
  VideoWidget({required this.video});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.video.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        controller.play();
        controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: controller.value.isInitialized
              ? VideoPlayer(controller)
              : CircularProgressIndicator(),
        ),
        Positioned(
          bottom: 80,
          left: 20,
          child: Text(widget.video.caption,
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        Positioned(
          right: 20,
          bottom: 120,
          child: Column(
            children: [
              Icon(Icons.favorite, color: Colors.white),
              Text('${widget.video.likes}',
                  style: TextStyle(color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}