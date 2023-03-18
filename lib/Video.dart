import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video_player extends StatefulWidget {
  const Video_player({super.key});

  @override
  State<Video_player> createState() => _Video_playerState();
}

class _Video_playerState extends State<Video_player> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/bts.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        // _controller.setLooping(true);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width:
                          constraints.maxWidth * _controller.value.aspectRatio,
                      height: constraints.maxHeight,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                );
              },
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
