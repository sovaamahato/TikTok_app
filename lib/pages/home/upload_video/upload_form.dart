import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:titctok_clone/widgets/global.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/input_textfield_widget.dart';

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
  TextEditingController artistSongTextEditingController = TextEditingController();
  TextEditingController descriptionTagTextEditingController = TextEditingController();

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

          SizedBox(height: 30,),

          //if uploadbutton is clicked we display progress bar else we ll display input text field
          showProgressBar==true?Container(
                        //progressbar here---------------
                      child: SimpleCircularProgressBar(progressColors: [
                        Colors.green,
                        Colors.red,
                        Colors.purple,
                        Colors.amber,
                        Colors.blueAccent

                      ],
                      animationDuration: 3,
                      backColor: Colors.white38,
                      
                      
                      ),

                        ):


            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  child: InputTextFieldWidget(
                    textEditingController: artistSongTextEditingController,
                    isObsecure: false,
                    labelText: "Artist - Song",
                    iconData: Icons.music_video_sharp,
                  ),
                ),
                SizedBox(height: 20,),
//description -tag---------
                 Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  child: InputTextFieldWidget(
                    textEditingController: descriptionTagTextEditingController,
                    isObsecure: false,
                    labelText: "Description - tag",
                    iconData: Icons.slideshow_sharp,
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                        // padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 38,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showProgressBar = true;
                            });

                            
                           
                          },
                          child: Center(
                              child: Text(
                            "Upload video",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
              ],
            )
        ]),
      ),
    );
  }
}
