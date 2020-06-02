import 'package:flutter/material.dart';

import 'home_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: HomeForm(),
      ),
    );
  }
}
