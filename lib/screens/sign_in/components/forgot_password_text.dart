import 'package:e_commerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';


class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    Key key, @required this.text
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName);
      },
      child: Text(text, style: TextStyle(
          decoration: TextDecoration.underline
      ),),
    );
  }
}