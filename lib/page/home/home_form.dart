import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wisplu_ecocode/common/styles/colors.dart';
import '../../page/device/device_screen.dart';
import '../../common/animation/openContainerBuilder.dart';
import '../../page/home/home_appbar.dart';
import '../../common/styles/constants.dart';
import 'home_listView_card.dart';
import 'home_title_msg.dart';
import '../../generated/l10n.dart';

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
  HomeListViewCard(
    switchStatus: false,
    iconPath: "assets/bathroom.png",
    positionName: "浴室",
    switchTotleMoney: "1029.48",
  ),
  HomeListViewCard(
    switchStatus: false,
    iconPath: "assets/bathroom.png",
    positionName: "浴室",
    switchTotleMoney: "1029.48",
  ),
  HomeListViewCard(
    switchStatus: false,
    iconPath: "assets/bathroom.png",
    positionName: "浴室",
    switchTotleMoney: "1029.48",
  ),
];

class _HomeFormState extends State<HomeForm> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      // color:  Color(0xFF444974),
      decoration: BoxDecoration(
        gradient: kScaffoldBackgroundGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          HomeAppbar(
            text: S.of(context).homeAppbar,
            onPressed: widget.appbarCallback,
          ),
          SizedBox(
            height: 30,
          ),
          HomeTtileMsg(todayMoney: "12345.99", marketPrice: "22.5"),
          Padding(
            padding: EdgeInsets.only(left: 3, top: 30, bottom: 10),
            child: Text(S.of(context).homeDerive,
                style: TextStyle(color: kSubTextColor, fontSize: 20)),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listviewDemo.length,
              itemBuilder: (context, position) {
                // return listviewDemo[position];
                // listview打開動畫
                return OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (BuildContext _, VoidCallback openContainer) {
                    return InkWell(
                      onTap: openContainer,
                      child: listviewDemo[position],
                    );
                  },
                  openWidget: DeviceScreen(
                    title: "客廳",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
