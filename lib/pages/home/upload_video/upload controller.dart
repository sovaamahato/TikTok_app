import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController{

  compressFile(String videoFilePath) async{
    final compressedVideoFile= await VideoCompress.compressVideo(videoFilePath, quality: VideoQuality.LowQuality);
  return compressedVideoFile!.file;
  
  }


  uploadCompressedVideoFileToFirebaseStorage(String videoID, String videoFilePath) async{
    UploadTask videoUploadTask =FirebaseStorage.instance.ref()
    .child("All videos")
    .child(videoID)
    .putFile(await compressFile(videoFilePath));

    TaskSnapshot snapshot = await videoUploadTask;

    String downloadUrlOfUploadedVideo=await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadedVideo;
  }


  getThumbnailImage(String videoFilePath) async{
    final thumbnail=await VideoCompress.getByteThumbnail(videoFilePath);
  }

  uploadThumbnailImageToFirebaseStorage(String videoID, String videoFilePath) async{
    UploadTask thumbnailImageUploadTask =FirebaseStorage.instance.ref()
    .child("All Thumbnail")
    .child(videoID)
    .putFile(await getThumbnailImage(videoFilePath));

    TaskSnapshot snapshot = await thumbnailImageUploadTask;

    String downloadUrlOfThumbnailImage=await snapshot.ref.getDownloadURL();
    return downloadUrlOfThumbnailImage;
  }




  //funtion to upload to database

  saveVideoInfoToFirebaseDatabase(String artistSongName, String descriptionTags, String videoFilePath, BuildContext context)async{
    try{
String videoID =DateTime.now().millisecondsSinceEpoch.toString();
      //1. upload video to storage
      String videoDownloadUrl= await uploadCompressedVideoFileToFirebaseStorage(videoID, videoFilePath);

      //2.upload thumbnail to storage
      String thumbnailDownloadUrl = await uploadThumbnailImageToFirebaseStorage(videoID, videoFilePath);

      //3. save overall video info to firestore database



    }catch(errorMsg){
      Get.snackbar("Error","Your Video is not Uploaded. Try Again.");
    }
  }
}