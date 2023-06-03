import 'package:flutter/material.dart';
import 'package:titctok_clone/pages/home/following/following.dart';
import 'package:titctok_clone/pages/home/profile/profile.dart';
import 'package:titctok_clone/pages/home/search/search.dart';
import 'package:titctok_clone/pages/home/upload_video/custom_icon.dart';
import 'package:titctok_clone/pages/home/upload_video/upload_video.dart';

import 'home/for_you/for_you.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var screenIndex=0;

  List screenList=[
    ForYou(),
    Search(),
    UploadVideo(),
    Following(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 30,),label: "Discover"),
          BottomNavigationBarItem(icon: CustomIcon(),label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.inbox_sharp,size: 30,),label: "Following"),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,),label: "profile"),
        ],
        onTap: (index){
            setState(() {
              
              screenIndex=index;
            });
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
      ),
      body:screenList[screenIndex] ,
    );
  }
}