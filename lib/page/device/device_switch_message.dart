import 'package:flutter_switch/flutter_switch.dart';
import 'package:wisplu_ecocode/common/styles/colors.dart';

import 'package:flutter/material.dart';

class ContainerSwitchMessage extends StatelessWidget {
  const ContainerSwitchMessage({
    this.topWidth,
    this.topHeight,
    this.width,
    this.height,
    this.borderWidth,
    this.onTap,
  });

  final double topWidth;
  final double topHeight;
  final double width;
  final double height;
  final double borderWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          // color: kLightColor,
          border: Border.all(width: 1.5, color: kLightColor),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        children: [
          SizedBox(
            height: height / 3,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "當前訊息",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width / 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "當前功率: 223 W",
                    style: TextStyle(color: kSubTextColor, fontSize: 12),
                  ),
                  Text(
                    "當前電壓: 110 V",
                    style: TextStyle(color: kSubTextColor, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "本月金額\nnt.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    "210.33",
                    style: TextStyle(
                      color: KFocusColor,
                      fontSize: width / 8,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterSwitch(
                activeText: "ON",
                activeTextColor: KFocusColor,
                activeColor: Colors.transparent,
                activeToggleColor: KFocusColor,
                inactiveColor: Colors.transparent,

                width: 55.0,
                height: 26.0,
                valueFontSize: 10.0,
                toggleSize: 14.0,
                value: false,
                showOnOff: true,
                onToggle: (val) {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
