import 'package:flutter/material.dart';
import '../../page/home/home_appbar.dart';
import '../../common/styles/constants.dart';
import 'home_listView_card.dart';
import 'home_title_msg.dart';

class HomeForm extends StatefulWidget {
  final VoidCallback appbarCallback;

  HomeForm({@required this.appbarCallback, key}) : super(key: key);

  @override
  _HomeFormState createState() => _HomeFormState();
}

List<Widget> listviewDemo = <Widget>[
  HomeListViewCard(
    switchStatus: true,
    iconPath: "assets/lamp.png",
    positionName: "客廳",
    switchTotleMoney: "600.35",
  ),
  HomeListViewCard(
    switchStatus: true,
    iconPath: "assets/bed.png",
    positionName: "臥室",
    switchTotleMoney: "711.21",
  ),
  HomeListViewCard(
    switchStatus: false,
    iconPath: "assets/microwave.png",
    positionName: "廚房",
    switchTotleMoney: "168.35",
  ),
  HomeListViewCard(
    switchStatus: false,
    iconPath: "assets/bathroom.png",
    positionName: "浴室",
    switchTotleMoney: "1029.48",
  ),
];

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: kScaffoldBackgroundGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppbar(
            onPressed: widget.appbarCallback,
          ),
          SizedBox(
            height: 40,
          ),
          HomeTtileMsg(todayMoney: "12345.99", marketPrice: "22.5"),
          Padding(
            padding: EdgeInsets.only(left: 3, top: 20, bottom: 20),
            child: Text("使用中裝置",
                style: TextStyle(color: Colors.white24, fontSize: 15)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, position) {
                return listviewDemo[position];
              },
            ),
          )
        ],
      ),
    );
  }
}
