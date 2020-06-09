import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wisplu_ecocode/common/styles/colors.dart';

class HomeAppbar extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const HomeAppbar({@required this.onPressed,@required this.text, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(color: kTextColor, fontSize: 16)),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        IconButton(
            icon: Image.asset(
              "assets/equalizer.png",
              height: 18.0,
              width: 18.0,
            ),
            onPressed: onPressed)
      ],
    );
  }
}
