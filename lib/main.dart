import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:titctok_clone/pages/authentication_controller.dart';

import 'pages/login_screen.dart';
import 'pages/signup_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // try {
  //   Firebase.apps.length == 0 ? Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: "AIzaSyByJA90cBfeVPKMcLJB-1EAcOredWvgb1E",
  //       appId: "1:190926144310:android:f510fa8b3cc0e2cfaf2997",
  //       messagingSenderId: "190926144310",
  //       projectId: "tiktok-app-clone-6fa4a",
  //     ),
  //   ).then((value) {
  //     Get.put(AuthenticationController());
  //   }) : Firebase.app();

  // } catch (error) {
  //   print('Error initializing Firebase: $error');
  // }


 
 await  Firebase.initializeApp(
          // options: DefaultFirebaseOptions.currentPlatform,
          )
      .then((value) {
    Get.put(AuthenticationController());
  });


  // Firebase.initializeApp(
  //   name: '',
  //   options:  FirebaseOptions(
  //     apiKey: 'AIzaSyByJA90cBfeVPKMcLJB-1EAcOredWvgb1E',
  //     authDomain: '',
  //     databaseURL: '',
  //     projectId: 'tiktok-app-clone-6fa4a',
  //     storageBucket: 'tiktok-app-clone-6fa4a.appspot.com',
  //     messagingSenderId: '190926144310',
  //     appId: '1:190926144310:android:f510fa8b3cc0e2cfaf2997',
  //     measurementId: '',
  //   ),
  // ); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Color.fromARGB(255, 36, 35, 35)),
      home: LoginScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthenticationController());
      }),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/SignUpScreen', page: () => SignUpScreen()),
      ],
    );
  }
}
