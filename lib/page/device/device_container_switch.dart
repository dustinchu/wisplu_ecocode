import '../../widget/inkWellOverlay.dart';
import 'package:flutter/material.dart';

class ContainerSwitch extends StatelessWidget {
  const ContainerSwitch({
    this.width,
    this.height,
    this.borderWidth,
    this.borderColor,
    this.onTap,
  });

  final double width;
  final double height;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWellOverlay(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
        ),
        openContainer: onTap);
  }
}
