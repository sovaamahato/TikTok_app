import 'package:flutter/material.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
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
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Upload Video",
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
