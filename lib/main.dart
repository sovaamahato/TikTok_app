import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:titctok_clone/pages/authentication_controller.dart';
import 'package:titctok_clone/pages/home_screen.dart';

import 'pages/login_screen.dart';
import 'pages/signup_screen.dart';



void main() async {
 await WidgetsFlutterBinding.ensureInitialized();

  


 
   Firebase.initializeApp(
          // options: DefaultFirebaseOptions.currentPlatform,
          )
      .then((value) {
    Get.put(AuthenticationController());
  });


  

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
      home:HomeScreen(),
      // LoginScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthenticationController());
      }),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        //GetPage(name: '/', page: () => LoginScreen()),
        //GetPage(name: '/SignUpScreen', page: () => SignUpScreen()),
      ],
    );
  }
}
