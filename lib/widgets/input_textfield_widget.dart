import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData? iconData;
  final String? imagereference;
  final String labelText;
  final bool isObsecure;

  InputTextFieldWidget(
      {required this.textEditingController,
      this.iconData,
      this.imagereference,
      required this.labelText,
      required this.isObsecure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      controller: textEditingController,
      decoration: InputDecoration(
        
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 18),
        prefixIcon: iconData != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(iconData),
              )
            : Image.asset(
                imagereference!,
                width: 10,
              ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.grey))
      ),
    );
  }
}
