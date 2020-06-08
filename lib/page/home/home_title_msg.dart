import 'package:flutter/material.dart';
import '../../common/styles/colors.dart';
import 'tooltipShapeBorder.dart';

class HomeTtileMsg extends StatelessWidget {
  final String todayMoney;
  final String marketPrice;
  const HomeTtileMsg(
      {@required this.todayMoney, @required this.marketPrice, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: new BoxDecoration(
                color: Colors.blueAccent[200],
                borderRadius: new BorderRadius.vertical(
                  top: const Radius.circular(90.0),
                  bottom: const Radius.circular(90.0),
                )),
            height: 100,
            width: 3),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "nt.",
              style: TextStyle(color: kTextColor),
            ),
            Text(
              todayMoney,
              style: TextStyle(color: Colors.blueAccent[200], fontSize: 35),
            ),
            Text(
              "今日總花費",
              style: TextStyle(color: kTextColor),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          decoration: ShapeDecoration(
            color: Colors.blueAccent[200],
            shape: TooltipShapeBorder(arrowArc: 0.5),
            shadows: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4.0, offset: Offset(2, 2))
            ],
          ),
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('目前電價', style: TextStyle(color: kTextColor)),
                  Text(marketPrice, style: TextStyle(color: kTextColor)),
                ],
              )),
        ),
      ],
    );
  }
}
