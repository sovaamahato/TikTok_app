import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/input_textfield_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailtextEditingController = TextEditingController();
    TextEditingController userNametextEditingController = TextEditingController();

  TextEditingController passwordtextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            
            const SizedBox(
              height: 50,
            ),
            Text(
              "Create an acoount ",
              style: GoogleFonts.acme(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            Text(
              "to connect with us!",
              style: GoogleFonts.acme(
                color: Colors.grey,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20,),
            //userName input textField--------------
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: InputTextFieldWidget(
                textEditingController: userNametextEditingController,
                isObsecure: false,
                labelText: "Username",
                iconData: Icons.person_2_outlined,
              ),
            ),
            
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
              height: 25,
            ),
            
                    
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
                           
                          },
                          child: Center(
                              child: Text(
                            "Sign Up",
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
                      "Aready have an account ?",
                      style: TextStyle(color: Colors.grey,
                       fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: (){
                    Get.to(LoginScreen());
                                          },
                      child: Text(
                        " Login Now",
                        style: TextStyle(color: Colors.white, 
                        fontSize: 24,fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
          

                        ),
          ]),
        ),
      ),
    );
  }
}