import 'package:flutter/material.dart';
import 'package:wisplu_ecocode/common/styles/colors.dart';

// ignore: must_be_immutable
class IndexCircular extends StatelessWidget {
  bool _status;
  IndexCircular({Key key, bool status})
      : _status = status,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 5, left: 5),
      child: new ClipRRect(
        borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
        child: new Container(
          width: 7.0,
          height: 7.0,
          color: _status ? kIndexCircularOn : kIndexCircularOff,
        ),
      ),
    );
  }
}
