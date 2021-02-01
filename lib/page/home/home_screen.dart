import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import '../../page/home/home_form.dart';

import 'home_inner.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  bool _onTapToClose = true;
  bool _swipe = true;
  bool _tapScaffold = false;
  InnerDrawerAnimation _animationType = InnerDrawerAnimation.static;
  //打開剩餘寬度
  double _offset = 0.3;

  double _dragUpdate = 0;

  InnerDrawerDirection _direction = InnerDrawerDirection.start;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Colors.black54;
  ValueChanged<Color> onColorChanged;

  changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: InnerDrawer(
        key: _innerDrawerKey,
        onTapClose: _onTapToClose,
        tapScaffoldEnabled: _tapScaffold,
        //leftOffset: _offset,rightOffset: _offset,
        velocity: 20,
        offset: IDOffset.horizontal(_offset),
        swipe: _swipe,
        boxShadow: _direction == InnerDrawerDirection.start &&
                _animationType == InnerDrawerAnimation.linear
            ? []
            : null,
        colorTransitionChild: currentColor,
        colorTransitionScaffold: currentColor,
        leftAnimationType: _animationType,
        rightAnimationType: InnerDrawerAnimation.linear,
        //滑動打開抽屜
        rightChild: HomeInner(
          onTap: () => _innerDrawerKey.currentState.toggle(),
          position: false,
        ),
        leftChild: HomeInner(
          onTap: () => _innerDrawerKey.currentState.toggle(),
          position: true,
        ),
        scaffold: Container(
          child: HomeForm(appbarCallback: () {
            _innerDrawerKey.currentState.toggle();
          }),
        ),

        onDragUpdate: (double val, InnerDrawerDirection direction) {
          _direction = direction;
          setState(() => _dragUpdate = val);
        },
      ),
    );
  }
}
