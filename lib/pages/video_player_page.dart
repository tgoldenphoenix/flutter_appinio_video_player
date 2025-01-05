import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

enum Source { Asset, Network }

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;

  // Source is an enum type defined above
  Source currentSource = Source.Asset;

  // parse string into Uri object
  // This work ok
  // String videoUri = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  // fpt trong dai dich COVID
  // Uri videoUri = Uri.parse("https://youtu.be/0zdBWjWO5UE?si=tfNkYgkR_JpdqX3m");

  // tot nghiep fpt
  String videoUri = "https://dn720300.ca.archive.org/0/items/watch-rocky-online-putlockers-2023-07-10-16-29-22/Watch%20Rocky%20Online%20-%20Putlockers_2023-07-10_16-29-22.mp4";

  String assetVideoPath = "assets/videos/rick-roll.mp4";

  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(currentSource);
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
            _sourceButtons(),
          ]
      )
    );
  }

  // which source to load the video from
  Widget _sourceButtons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          color: Colors.red,
          child: const Text(
            "Network",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              currentSource = Source.Network;
              initializeVideoPlayer(currentSource);
            });
          },
        ),
        MaterialButton(
          color: Colors.red,
          child: const Text(
            "Asset",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              currentSource = Source.Asset;
              initializeVideoPlayer(currentSource);
            });
          },
        ),
      ],
    );
  }

  void initializeVideoPlayer(Source source) {
    CachedVideoPlayerController _videoPlayerController;

    if (source == Source.Asset) {
      _videoPlayerController = CachedVideoPlayerController.asset(assetVideoPath)
        ..initialize().then((value) {
          setState(() {

          });
        });
    } else if (source == Source.Network) {
      _videoPlayerController = CachedVideoPlayerController.network(videoUri)
        ..initialize().then((value) {
          setState(() {
            // isLoading = false;
          });
        });
    } else {
      return;
    }

    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }
}