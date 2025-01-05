import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;

  String assetVideoPath = "assets/videos/rick-roll.mp4";

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController),
          ]
      )
    );
  }

  void initializeVideoPlayer() {
    CachedVideoPlayerController _videoPlayerController;

    _videoPlayerController = CachedVideoPlayerController.asset(assetVideoPath)
      ..initialize().then((value) {
        setState(() {

        });
      });

    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }
}