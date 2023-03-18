import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'TO DO/todo_list.dart';
import 'notes/home_screen.dart';
import 'whiteboard/white.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/bt.mp4')
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
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      Center(
                        child: Container(
                            // width: ,
                            height: 300,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              // color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              height: 50, // set the height of the container
                              // color: Colors.black, // set the background color
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                // center the text horizontally
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 240,
                                      height: 200,
                                      color: Color.fromARGB(150, 5, 5, 78),
                                      child: GestureDetector(
                                          onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()),
                                              ),
                                          child: Image(
                                            // width: 150,
                                            image:
                                                AssetImage('images/notes.gif'),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 240,
                                      height: 200,
                                      color: Color.fromARGB(150, 5, 5, 78),
                                      child: GestureDetector(
                                          onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DrawingBoard()),
                                              ),
                                          child: Image(
                                            // width: 150,
                                            image: AssetImage(
                                                'images/WhiteBoard.gif'),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 240,
                                      height: 200,
                                      color: Color.fromARGB(150, 5, 5, 78),
                                      child: GestureDetector(
                                          onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TODO()),
                                              ),
                                          child: Image(
                                            // width: 150,
                                            image:
                                                AssetImage('images/todo.gif'),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                );
              },
            )
          : Container(
              // width: MediaQuery.of(context).size.height,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('images/newimage.jpg'),
              //         fit: BoxFit.cover)),
              // child: Text("Hellooooooooo"),
              ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
