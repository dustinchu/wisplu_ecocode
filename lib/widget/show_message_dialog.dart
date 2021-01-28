import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ShowMessageDialog(BuildContext context, String Msg) {
  // showDialog(
  //    builder: (BuildContext context) {
  //      context: context,
  //     return CupertinoAlertDialog(
  //       title: new Column(
  //         children: <Widget>[Text(Msg)],
  //       ),
  //       actions: <Widget>[
  //         new FlatButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: new Text("OK"))
  //       ],
  //     )
  //    }

  //     );

  // set up the AlertDialog
  CupertinoAlertDialog alert = CupertinoAlertDialog(
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
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
