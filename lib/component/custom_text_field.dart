import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  Icon icon;
  bool isPassword;
  CustomTextField({required this.controller,required this.hintText,required this.icon,required this.isPassword});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintText
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'tidak boleh kosong';
        }
        return null;
      },
    );
  }
}
