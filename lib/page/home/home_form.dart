import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
                  Text("概覽"),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
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
