import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  String controlName;
  bool obscureText;
  CustomTextField({this.hintText,@required this.controlName,this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      child: ReactiveTextField(
        formControlName:controlName ,
        obscureText: obscureText,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            hintText: hintText ?? "",
            hintStyle: TextStyle(fontSize: 20.0),
            filled: true,
            fillColor: Color(0xFFECEDF1),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  width: 0.0,
                  color: Colors.transparent,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  width: 0.0,
                  color: Colors.transparent,
                ))),
      ),
    );
  }
}
