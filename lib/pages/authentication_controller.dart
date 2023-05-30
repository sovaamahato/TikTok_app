import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:titctok_clone/pages/login_screen.dart';
import 'package:titctok_clone/widgets/global.dart';
import 'user.dart' as userModal;

class AuthenticationController extends GetxController {
  static AuthenticationController instanceAuth = Get.find();

  late Rx<File?> _pickedFile;

  File? get profileImage => _pickedFile.value;

  void chooseImageFromGallery() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImageFile != null) {
      Get.snackbar("profile image", "successfully selected profile picture");
    }
    _pickedFile = Rx<File>(File(pickedImageFile!.path));
  }

  void captureImageWithCamera() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImageFile != null) {
      Get.snackbar("profile image", "successfully selected profile picture");
    }
    _pickedFile = Rx<File>(File(pickedImageFile!.path));
  }

  void createNewAccount(File imageFile, String userName, String userEmail,
      String password) async {
//          File? imageFile = _pickedFile.value;
// if (imageFile == null) {
//   // Handle the case where the image file is null
//   return;
// }
    try {
      showProgressBar = true;
      //1. create user in the firebase authentication
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: password);

      //2.save user profile image to firebase storage
      String imageDownloadUrl = await uploadImageToStorage(imageFile);

      //3.save the user data to the firebase database
      userModal.User user = userModal.User(
        name: userName,
        email: userEmail,
        image: imageDownloadUrl,
        uid: credential.user!.uid,
      );
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(credential.user!.uid)
          .set(user.toJson());

      showProgressBar = false;
      Get.snackbar("Account created!",
          "Congratulations! Your account created successfully");
      Get.to(LoginScreen());
    } on FirebaseAuthException catch (e) {
      showProgressBar = false;
     
      if (e.code == 'email-already-in-use') {
        Get.snackbar("Account creation unsuccessful",
            "The email address is already in use by another account.");
      } else {
        Get.snackbar("Account creation unsuccessful",
            "An error occurred while creating account! Try Again.");
      }
    } catch (error) {
      showProgressBar = false;
      print(error);
      Get.snackbar("Account creation unsuccessful",
          "An error occurred while creating account! Try Again." );
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("Profile images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrlUploadImage = await taskSnapshot.ref.getDownloadURL();
    return downloadUrlUploadImage;
  }
}
