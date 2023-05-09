import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String? name;
  String?uid;
  String? email;
  String? image;
  String? youtube;
  String? facebook;
  String? twitter;
  String? instagram;

  User({
    this.name,
    this.uid,
    this.email,
    this.image,
    this.youtube,
    this.facebook,
    this.twitter,
    this.instagram,
  });


  Map<String, dynamic>toJson()=>{
    "name":name,
    "uid":uid,
    "email":email,
    "image":image,
    "youtube":youtube,
    "facebook":facebook,
    "twitter":twitter,
    "instagram":instagram
  };


//to extract data from the database (firestore cloud) 
  static User fromSnap(DocumentSnapshot snapshot){
    var dataSnapshot=snapshot.data() as Map<String, dynamic>;
    return User(
      name: dataSnapshot["name"],
      uid: dataSnapshot["uid"],
      email: dataSnapshot["email"],
      image: dataSnapshot["image"],
      youtube: dataSnapshot["youtube"],
      facebook: dataSnapshot["facebook"],
      twitter: dataSnapshot["twitter"],
      instagram: dataSnapshot["instagram"],


    );
  }

}