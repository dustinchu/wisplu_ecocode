import 'package:flutter/material.dart';
import '../user_repository.dart';
import '../register/register.dart';
import '.././common/styles/colors.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        '申請帳號',
        style: kLoginTextColor,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
