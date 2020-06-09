import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wisplu_ecocode/common/styles/colors.dart';

class DeviceAppbar extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const DeviceAppbar({@required this.onPressed, @required this.text, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
            onPressed: onPressed),
        Expanded(
          flex: 1,
          child: Center(
              child: Text(text,
                  style: TextStyle(color: kTextColor, fontSize: 20))),
        ),
        // SizedBox(
        //   width: 30.0,
        // )
         IconButton(
            icon: Icon(Icons.arrow_back,size: 30,color: Colors.transparent,),
            onPressed: null),
      ],
    );
  }
}
