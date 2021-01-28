import 'package:flutter/material.dart';
import '../../common/styles/colors.dart';

class TextBtn extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;

  TextBtn({Key key, @required this.onTap, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        text,
        style: TextStyle(color: kLoginTextColor),
      ),
      onTap: onTap,
    );
  }
}
