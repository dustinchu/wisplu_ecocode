import '../../widget/inkWellOverlay.dart';
import 'package:flutter/material.dart';

class ContainerSwitch extends StatelessWidget {
  const ContainerSwitch({
    this.topWidth,
    this.topHeight,
    this.width,
    this.height,
    this.borderWidth,
    this.topBorderColor,
    this.borderColor,
    this.onTap,
  });

  final double topWidth;
  final double topHeight;
  final double width;
  final double height;
  final double borderWidth;
  final Color topBorderColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWellOverlay(
        child: Container(
          height: topHeight,
          width: topWidth,
          decoration: BoxDecoration(
              color: topBorderColor,
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints:
                    BoxConstraints.expand(width: width, height: height),
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor, width: borderWidth),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
        ),
        openContainer: onTap);
  }
}
