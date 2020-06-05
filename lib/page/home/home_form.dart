import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wisplu_ecocode/widget/tooltipShapeBorder.dart';
import '../../common/styles/colors.dart';
import 'package:wisplu_ecocode/test/customElevation.dart';
import '../../common/styles/constants.dart';

class HomeForm extends StatefulWidget {
  HomeForm({Key key}) : super(key: key);

  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    Widget _appbar() {
      return Row(
        children: [
          Text("概覽", style: TextStyle(color: kTextDarkColor, fontSize: 16)),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      );
    }

    Widget _titleMessage() {
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
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "2101.53",
                style: TextStyle(color: Colors.blueAccent[200], fontSize: 35),
              ),
              Text(
                "今日總花費",
                style: TextStyle(color: Colors.white),
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
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(2, 2))
              ],
            ),
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('目前電價', style: TextStyle(color: Colors.white)),
                    Text('22.5', style: TextStyle(color: Colors.white)),
                  ],
                )),
          ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: kScaffoldBackgroundGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbar(),
          SizedBox(
            height: 40,
          ),
          _titleMessage(),
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
                return Container(
                  padding: EdgeInsets.only(bottom: 10),
                  height: 100,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height:5),
                          Container(

                            color: Colors.blueAccent[200],
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/bed.png",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("客廳",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Text("使用中",
                                                style: TextStyle(
                                                    color:
                                                        Colors.blueAccent[200]))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 30, bottom: 25),
                                          child: Text("nt",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                        Text(
                                          "600.35",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
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
              },
            ),
          )
        ],
      ),
    );
  }
}
