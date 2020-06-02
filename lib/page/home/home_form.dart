import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Container(
        decoration: BoxDecoration(
          gradient: kScaffoldBackgroundGradient,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
          child: Column(
            children: [
              Row(
                children: [
                  Text("概覽", style:TextStyle(color: kTextDarkColor,fontSize: 16)),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  IconButton(icon:FaIcon(FontAwesomeIcons.bars,color: Colors.white,) , onPressed: null)
                ],
              ),
              SizedBox(height:20),
              Row(children: [
                Container(height:30,width: 1,color: Colors.blueAccent[200],),
              ],),
              CustomElevation(
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text('Custom Elevation'),
                ),
              )
            ],
          ),
        ));
  }
}
