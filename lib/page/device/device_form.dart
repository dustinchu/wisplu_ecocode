import '../../generated/l10n.dart';

import '../../common/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../common/styles/constants.dart';
import 'device_circle.dart';
import 'device_circle_progress_bar.dart';
import '../../widget/arrow_appbar.dart';
import 'device_container_switch.dart';
import 'device_index_circular.dart';
import 'device_menu_button.dart';
import 'device_switch_message.dart';

class DeviceForm extends StatelessWidget {
  final String title;
  DeviceForm({@required this.title, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        gradient: kScaffoldBackgroundGradient,
      ),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ArrowAppbar(
            text: title,
            onPressed: () => Navigator.pop(context, true),
          ),
          SizedBox(height: 10),
          menuBtn(
              S.of(context).deviceMenuButton, S.of(context).deviceChartButton),
          Expanded(
              child: DeviceCircle(
                  money: "600.35",
                  titleText: S.of(context).deviceCircleTotleMoney,
                  radiusSize: w / 5,
                  progress: 0.8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IndexCircular(
                status: true,
              ),
              IndexCircular(
                status: false,
              ),
              IndexCircular(
                status: false,
              ),
              IndexCircular(
                status: false,
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                ContainerSwitch(
                  topHeight: 30,
                  topWidth: w / 2 - 20,
                  height: 2,
                  width: w / 2 - 60,
                  borderWidth: 1,
                  topBorderColor: kSwitchInkWelColor,
                  borderColor: kSwitchOffColor,
                  onTap: () => print("123"),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerSwitch(
                      topHeight: w / 2 - 20,
                      topWidth: 30,
                      height: w / 2 - 60,
                      width: 2,
                      borderWidth: 1,
                      topBorderColor: kSwitchInkWelColor,
                      borderColor: kLightColor,
                      onTap: () => print("123"),
                    ),
                    ContainerSwitchMessage(
                      height: w / 2,
                      width: w / 2,
                      onTap: () => print("123"),
                    ),
                    ContainerSwitch(
                      topHeight: w / 2 - 20,
                      topWidth: 30,
                      height: w / 2 - 60,
                      width: 2,
                      borderWidth: 1,
                      topBorderColor: kSwitchInkWelColor,
                      borderColor: kSwitchOffColor,
                      onTap: () => print("123"),
                    ),
                  ],
                ),
                ContainerSwitch(
                  topHeight: 30,
                  topWidth: w / 2 - 20,
                  height: 2,
                  width: w / 2 - 60,
                  borderWidth: 1,
                  topBorderColor: kSwitchInkWelColor,
                  borderColor: kSwitchOffColor,
                  onTap: () => print("123"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circle(String money, String titleText, double radiusSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Image.asset(
              "assets/Arrow-left.png",
              height: 40.0,
              width: 40.0,
            ),
            onPressed: null),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
                maxRadius: radiusSize,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("nt.", style: TextStyle(color: Colors.white)),
                      Text(money,
                          style: TextStyle(color: kLightColor, fontSize: 25)),
                      Text(titleText,
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ),
              CircleProgressBar(
                radius: radiusSize + 30,
                dotRadius: 5.0,
                progress: 0.6,
                progressStartColor: Color.fromRGBO(0, 255, 252, 0.9),
                progressEndColor: kLightColor,

                //  progressColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
            icon: Image.asset(
              "assets/Arrow-right.png",
              height: 40.0,
              width: 40.0,
            ),
            onPressed: null)
      ],
    );
  }

  Widget menuBtn(String leftText, String rightText) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
                text: leftText,
                textColor: kLightColor,
                backColor: Color.fromRGBO(255, 255, 255, 0.1),
                onPressed: () => print("123")),
            SizedBox(
              width: 20,
            ),
            MenuButton(
                text: rightText,
                textColor: Colors.white,
                backColor: Color.fromRGBO(255, 255, 255, 0.1),
                onPressed: () => print("123")),
          ],
        )),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
