import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  void createNewAccount(File imageFile, String username, String UserEmail,
      String password) async {
    //1. create user in the firebase authentication
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: UserEmail, password: password);
    //2.save user profile image to firebase storage

    String imageDownloasUrl = await uploadImageToStorage(imageFile);
    //3.save the user data to the firebase database
  }

  Future<String> uploadImageToStorage(File imageFile)  async{
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("Profile images")
        .child(FirebaseAuth.instance.currentUser!.uid);

        UploadTask uploadTask = reference.putFile(imageFile);
        TaskSnapshot taskSnapshot= await uploadTask;

        String downloadUrlUploadImage= await taskSnapshot.ref.getDownloadURL(); 
    return downloadUrlUploadImage;
  }
}
