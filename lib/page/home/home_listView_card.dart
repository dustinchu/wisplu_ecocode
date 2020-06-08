import 'package:flutter/material.dart';
import '../../common/styles/colors.dart';

class HomeListViewCard extends StatelessWidget {
  final bool switchStatus;
  final String iconPath;
  final String positionName;
  final String switchTotleMoney;

  HomeListViewCard(
      {@required this.switchStatus,
      @required this.iconPath,
      @required this.positionName,
      @required this.switchTotleMoney,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: 90,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(height: 5),
              Container(
                color: switchStatus ? kSwitchOnColor : kSwitchOffColor,
                width: 3,
                height: 40,
              ),
            ],
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        iconPath,
                        height: 45.0,
                        width: 45.0,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(positionName,
                                    style: TextStyle(color: Colors.white)),
                                Text(switchStatus ? "使用中" : "未使用",
                                    style: TextStyle(
                                        color: switchStatus
                                            ? Colors.blueAccent[200]
                                            : Colors.white54))
                              ],
                            ),
                            Padding(
                              padding: MediaQuery.of(context).size.width < 400
                                  ? const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 25)
                                  : const EdgeInsets.only(
                                      left: 25, right: 25, bottom: 25),
                              child: Text("nt",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Text(
                              switchTotleMoney,
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
