import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';


class OTPScreen extends StatelessWidget {
  const OTPScreen({Key key}) : super(key: key);
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text("OTP Verification")),
      body: Body(),
    );
  }
}
