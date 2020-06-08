import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String iconPath;
  final bool iconStatus;
  final double circular;
  final Color color;
  final Color textColor;
  final Color borderColor;
  StaggerAnimation({
    Key key,
    @required this.color,
    @required this.circular,
    @required this.buttonController,
    @required this.onTap,
    @required this.text = "Sign In",
    @required this.textColor,
    @required this.borderColor,
    this.iconPath = "assets/google-logo.png",
    this.iconStatus = false,
  })  : buttonSqueezeanimation = Tween(
          begin: 320.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.0,
              0.150,
            ),
          ),
        ),
        containerCircleAnimation = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 30.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSqueezeanimation.value,
        height: 50,
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          border: new Border.all(color: borderColor, width: 0.5), // 邊色寬度
          color: color, // 底色
          borderRadius: new BorderRadius.circular((circular)), // 圆角度
        ),
        // decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        // borderRadius: BorderRadius.all(const Radius.circular(25.0)),
        // ),
        child: buttonSqueezeanimation.value > 75.0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconStatus
                      ? Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Image.asset(
                            iconPath,
                            height: 18.0,
                            width: 18.0,
                          ),
                        )
                      : Container(),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      // fontWeight: FontWeight.w300,
                      letterSpacing: 0.3,
                    ),
                  )
                ],
              )
            : CircularProgressIndicator(
                value: null,
                strokeWidth: 1.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}
