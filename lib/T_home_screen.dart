// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'bloc/authentication_bloc/authentication_bloc.dart';

// class THomeScreen extends StatelessWidget {
//   final String name;

//   THomeScreen({Key key, @required this.name}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.exit_to_app),
//             onPressed: () {
//               BlocProvider.of<AuthenticationBloc>(context).add(
//                 AuthenticationLoggedOut(),
//               );
//             },
//           )
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Center(child: Text('Welcome $name!')),
//         ],
//       ),
//     );
//   }
// }
