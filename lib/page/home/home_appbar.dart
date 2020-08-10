import 'package:flutter/material.dart';
import '../../common/styles/colors.dart';

class HomeAppbar extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const HomeAppbar({@required this.onPressed,@required this.text, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(color: kTextColor, fontSize: 20)),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        IconButton(
            icon: Image.asset(
              "assets/equalizer.png",
              height: 20.0,
              width: 20.0,
            ),
            onPressed: onPressed)
      ],
    );
  }
}
