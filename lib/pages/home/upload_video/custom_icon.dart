import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 32,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12),
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 44, 108),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 35, 211, 234),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),

              ),
              child: const Icon(Icons.add,size: 24,color: Colors.black,),
            ),
          )
        ],
      ),
    );
  }
}
