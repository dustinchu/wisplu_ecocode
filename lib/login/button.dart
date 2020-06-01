import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StaggerAnimation extends StatelessWidget {
  final VoidCallback onTap;
  final String titleButton;
  final IconData iconButton;
  final bool iconStatus;

  StaggerAnimation({
    Key key,
    this.buttonController,
    this.onTap,
    this.titleButton = "Sign In",
    this.iconButton = FontAwesomeIcons.google,
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
          border: new Border.all(color: Colors.white, width: 0.5), // 边色与边宽度
          color: Colors.transparent, // 底色
          //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
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
                          child: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                  Text(
                    titleButton,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
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
