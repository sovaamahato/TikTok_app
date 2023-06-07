import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
  String? userID;
  String? userName;
  String? videoID;
  int? totalComments;
  int? totalShare;
  List?likersList;
  String? artistSongName;
  String?  descriptionTags;
  String? videoUrl;
  String? thumbnailUrl;
  int? publishedDateTime;


  Video({
    this.userID,
    this.userName,
    this.videoID,
    this.totalComments,
    this.totalShare,
    this.likersList,
    this.artistSongName,
    this.descriptionTags,
    this.videoUrl,
    this.thumbnailUrl,
    this.publishedDateTime
  });


  Map<String, dynamic> toJason()=>{
    "UserID":userID,
    "userName":userName,
    "videoID":videoID,
    "totalComments":totalComments,
    "totalShare":totalShare,
    "likersList":likersList,
    "artistSongName":artistSongName,
    "descriptionTags":descriptionTags,
    "videoUrl":videoUrl,
    "thumbnailUrl":thumbnailUrl,
    "publishedDateTime":publishedDateTime,
  };


  static Video fromDocumentSnapshot(DocumentSnapshot snapshot){
    var docSnapshot=snapshot.data() as Map<String,dynamic>;
  return Video(
    userID:docSnapshot["userID"],
    userName:docSnapshot["userName"],
    videoID:docSnapshot["videoID"],
    totalComments:docSnapshot["totalComments"],
    totalShare:docSnapshot["totalShare"],
    likersList:docSnapshot["userID"],
    artistSongName:docSnapshot["artistSongName"],
    descriptionTags:docSnapshot["descriptionTags"],
    videoUrl:docSnapshot["userID"],
    thumbnailUrl:docSnapshot["userID"],
    publishedDateTime:docSnapshot["publishedDateTime"],
  );
  
  }

}