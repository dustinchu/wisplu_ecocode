import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    this.text,
    this.textColor,
    this.backColor,
    this.onPressed,
  });

  final String text;
  final Color textColor;
  final Color backColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
                      child: Text(
                       text,
                        style: TextStyle(color: textColor),
                      ),
                      color: backColor,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      onPressed: onPressed);
  }
}