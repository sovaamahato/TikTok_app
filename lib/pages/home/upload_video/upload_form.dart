import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UploadForm extends StatefulWidget {
  //const UploadForm({super.key});
  final File videoFile;
  final String videoPath;
  UploadForm({required this.videoFile, required this.videoPath});

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  VideoPlayerController? palyerController;

  @override
  void initState() {
    super.initState();
    setState(() {
      //yo page open hune bitikai this will be called and
      //this part of code simply takes the selected video and play it in loop automatically just like in tiktok
      //when we choose a video from gallery and it start paling in loop
      palyerController = VideoPlayerController.file(widget.videoFile);
    });
    palyerController!.initialize();
    palyerController!.play();
    palyerController!.setVolume(2);
    palyerController!.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    palyerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          //
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width,
            child: VideoPlayer(palyerController!),
          ),
        ]),
      ),
    );
  }
}
