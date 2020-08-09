import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisplu_ecocode/generated/l10n.dart';

 ShowMessageDialog (BuildContext context ,String Msg){
  showDialog(
              context: context,
              child: CupertinoAlertDialog(
                title: new Column(
                  children: <Widget>[Text(Msg)],
                ),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text("OK"))
                ],
              ));
}