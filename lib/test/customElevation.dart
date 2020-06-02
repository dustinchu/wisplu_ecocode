import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;

  CustomElevation({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: this.child,
    );
  }
}
//Usecase 
// CustomElevation(
//   child: FlatButton(
//     color: Colors.blue,
//     onPressed: () {},
//     child: Text('Custom Elevation'),
//   ),
// )

//圓角陰影按鈕 

// class CustomElevation extends StatelessWidget {
//   final Widget child;
//   final double height;

//   CustomElevation({@required this.child, @required this.height})
//       : assert(child != null);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: this.height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(this.height / 2)),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.blue.withOpacity(0.2),
//             blurRadius: height / 5,
//             offset: Offset(0, height / 5),
//           ),
//         ],
//       ),
//       child: this.child,
//     );
//   }
// }
// then 
// CustomElevation(
//   height: 60,
//   child: FlatButton(
//     shape: StadiumBorder(),
//     color: Colors.blue,
//     onPressed: () {},
//     child: Text('Custom Elevation'),
//   ),
// )