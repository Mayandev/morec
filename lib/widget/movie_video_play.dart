import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';


class MovieVideoPlay extends StatefulWidget {
  final String url;

  const MovieVideoPlay({Key key, this.url}) : super(key: key);
  @override
  _MovieVideoPlayState createState() => _MovieVideoPlayState();
}

class _MovieVideoPlayState extends State<MovieVideoPlay> {

  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  @override
  void initState() { 
    super.initState();
    videoPlayerController = VideoPlayerController.network(this.widget.url);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black
        ),
        constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
        child: Chewie(
          controller: chewieController
        )
      ),
    );
  }
}
