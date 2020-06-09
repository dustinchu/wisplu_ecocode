import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisplu_ecocode/page/device/device_form.dart';
import '../../bloc/login/bloc.dart';
import '../../user_repository.dart';
import '../login/login.dart';

class DeviceScreen extends StatelessWidget {
  final String title;
  DeviceScreen({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DeviceForm(title: title),
      ),
    );
  }
}
