import 'package:flutter/material.dart';

class LineElevation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width:double.infinity,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}