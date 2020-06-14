import 'package:flutter/material.dart';

import 'device_form.dart';

class DeviceScreen extends StatelessWidget {
  final String title;
  DeviceScreen({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.transparent,
        body: DeviceForm(title: title),
    );
  }
}
