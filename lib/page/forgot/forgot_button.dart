import 'package:flutter/material.dart';

class ForgotButton extends StatelessWidget {
  final VoidCallback _onPressed;

  ForgotButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueAccent[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPressed,
      child: Text('Register',style: TextStyle(color: Colors.white),),
    );
  }
}
