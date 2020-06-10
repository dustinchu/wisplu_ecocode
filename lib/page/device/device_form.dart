
import 'package:wisplu_ecocode/generated/l10n.dart';

import '../../common/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../common/styles/constants.dart';
import 'device_circle_progress_bar.dart';
import 'device_appbar.dart';
import 'device_container_switch.dart';
import 'device_index_circular.dart';
import 'device_menu_button.dart';

class DeviceForm extends StatelessWidget {
  final String title;
  DeviceForm({@required this.title, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: kScaffoldBackgroundGradient,
      ),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          DeviceAppbar(
            text: title,
            onPressed: () => Navigator.pop(context, true),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuButton(
                      text: S.of(context).deviceMenuButton,
                      textColor: kLightColor,
                      backColor: Color.fromRGBO(255, 255, 255, 0.1),
                      onPressed: () => print("123")),
                  SizedBox(
                    width: 20,
                  ),
                  MenuButton(
                      text: S.of(context).deviceChartButton,
                      textColor: Colors.white,
                      backColor: Color.fromRGBO(255, 255, 255, 0.1),
                      onPressed: () => print("123")),
                ],
              )),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          Row(
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
                      maxRadius: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("nt.", style: TextStyle(color: Colors.white)),
                            Text("600.35",
                                style: TextStyle(
                                    color: kLightColor, fontSize: 25)),
                            Text(S.of(context).deviceCircleTotleMoney,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    CircleProgressBar(
                      radius: 100.0,
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
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IndexCircular(
                color: Colors.white,
              ),
              IndexCircular(
                color: Color.fromRGBO(255, 255, 255, 0.1),
              ),
              IndexCircular(
                color: Color.fromRGBO(255, 255, 255, 0.1),
              ),
              IndexCircular(
                color: Color.fromRGBO(255, 255, 255, 0.1),
              ),
            ],
          ),
          SizedBox(height: 40),
          ContainerSwitch(
            height: 2,
            width: 100,
            borderWidth: 1,
            borderColor: kLightColor,
            onTap: () => print("123"),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerSwitch(
                height: 100,
                width: 2,
                borderWidth: 1,
                borderColor: kLightColor,
                onTap: () => print("123"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ContainerSwitch(
                  height: 170,
                  width: 170,
                  borderWidth: 1,
                  borderColor: kLightColor,
                  onTap: () => print("123"),
                ),
              ),
              ContainerSwitch(
                height: 100,
                width: 2,
                borderWidth: 1,
                borderColor: kLightColor,
                onTap: () => print("123"),
              ),
            ],
          ),
          ContainerSwitch(
            height: 2,
            width: 100,
            borderWidth: 1,
            borderColor: kLightColor,
            onTap: () => print("123"),
          ),
        ],
      ),
    );
  }
}
