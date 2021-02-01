import 'package:flutter/material.dart';
import 'package:wisplu_ecocode/common/styles/colors.dart';

import 'device_circle_progress_bar.dart';

class DeviceCircle extends StatelessWidget {
  String _money;
  String _titleText;
  double _radiusSize;
  double _progress;
  DeviceCircle(
      {Key key,
      String money,
      String titleText,
      double radiusSize,
      double progress})
      : _money = money,
        _titleText = titleText,
        _radiusSize = radiusSize,
        _progress = progress,
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
                maxRadius: _radiusSize,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("nt.", style: TextStyle(color: Colors.white)),
                      Text(_money,
                          style: TextStyle(color: kLightColor, fontSize: 25)),
                      Text(_titleText,
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ),
              CircleProgressBar(
                radius: _radiusSize + 30,
                dotRadius: 5.0,
                progress: 0.2,
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
}
