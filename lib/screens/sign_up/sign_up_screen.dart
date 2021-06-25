import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}