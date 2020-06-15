import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final IconData icon;
  final Color iconColor;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  LoginTextFormField(
      {@required this.validator,
      @required this.controller,
      @required this.icon,
      @required this.iconColor,
      @required this.hintText,
      @required this.keyboardType,
      @required this.obscureText,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: iconColor),
          filled: true, //背景是否填充
          fillColor: Color.fromRGBO(255, 255, 255, 0.1),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
        ),
        obscureText: obscureText,
        autovalidate: true,
        autocorrect: false,
        validator: validator);
  }
}
