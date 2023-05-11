import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/global.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:titctok_clone/pages/signup_screen.dart';

import '../widgets/input_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "images/tik-tok.png",
              width: 170,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Welcome",
              style: GoogleFonts.acme(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            Text(
              "Glad to see you!",
              style: GoogleFonts.acme(
                color: Colors.grey,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20,),
            //emial input textField--------------
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: InputTextFieldWidget(
                textEditingController: emailtextEditingController,
                isObsecure: false,
                labelText: "Email",
                iconData: Icons.email_outlined,
              ),
            ),
            //password input textField-------------
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: InputTextFieldWidget(
                textEditingController: passwordtextEditingController,
                isObsecure: true,
                labelText: "Password",
                iconData: Icons.lock_outlined,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            showProgressBar == false
                    ?
            Column(
              children: [
                //login button---------------------------------
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
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    
                        SizedBox(height: 15,),
                //signup button------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.grey,
                       fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: (){
                    Get.to(SignUpScreen());
                                          },
                      child: Text(
                        " Sign Up Now",
                        style: TextStyle(color: Colors.white, 
                        fontSize: 24,fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ): Container(
                        //progressbar here---------------
                      child: SimpleCircularProgressBar(progressColors: [
                        Colors.green,
                        Colors.red,
                        Colors.purple,
                        Colors.amber,
                        Colors.blueAccent

                      ],
                      animationDuration: 3,
                      
                      ),

                        ),
          ]),
        ),
      ),
    );
  }
}
