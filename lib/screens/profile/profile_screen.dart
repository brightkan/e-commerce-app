
import 'package:e_commerce_app/components/custom_botton_navbar.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/enums.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu:MenuState.profile),
    );
  }
}


