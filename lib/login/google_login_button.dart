// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../login/login.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton.icon(
//       // shape: RoundedRectangleBorder(
//       //   borderRadius: BorderRadius.circular(30.0),
//       // ),
//       icon: Icon(FontAwesomeIcons.google, color: Colors.white),
//       onPressed: () {
//         BlocProvider.of<LoginBloc>(context).add(
//           LoginWithGooglePressed(),
//         );
//       },
//       label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
//       color: Colors.transparent,
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../widget/animation_button.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final AnimationController buttonController;

  GoogleLoginButton(
      {@required this.onTap, @required this.buttonController, Key key})
      : assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggerAnimation(
        color: Colors.white,
        borderColor: Colors.white,
        circular: 30,
        text: "Google",
        textColor: Colors.black.withOpacity(0.54),
        buttonController: buttonController.view,
        iconPath: "assets/google-logo.png",
        iconStatus: true,
        onTap: onTap);
  }
}
