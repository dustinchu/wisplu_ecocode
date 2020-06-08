import 'package:flutter/material.dart';
import '../../widget/animation_button.dart';

class FacebookLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final AnimationController buttonController;
  final String text;

  FacebookLoginButton(
      {@required this.onTap, @required this.buttonController,@required this.text,Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggerAnimation(
        color: Color(0xFF4267B2),
        borderColor: Color(0xFF4267B2),
        circular: 30,
        text: text,
        textColor: Colors.black.withOpacity(0.54),
        buttonController: buttonController.view,
        iconPath: "assets/facebook-logo.png",
        iconStatus: true,
        onTap: onTap);
  }
}
