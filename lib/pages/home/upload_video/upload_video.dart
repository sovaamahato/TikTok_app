import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  Future ShowDialogBox() {
    return showDialog(
        context: context,
        builder: ((context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Get video from Gallery",
                            maxLines: 3,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),


                SimpleDialogOption(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Capture video with camera",
                            maxLines: 3,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),


                SimpleDialogOption(
                  onPressed: () {

                    Get.back();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/upload_video1.jpg",
              width: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  ShowDialogBox();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Upload Video",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
