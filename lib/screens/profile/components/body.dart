import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/profile/components/profile_menu_item.dart';
import 'package:e_commerce_app/screens/profile/components/profile_picture.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePicture(),
          SizedBox(height: 20),
          ProfileMenuItem(
              icon: "assets/icons/User Icon.svg",
              text: "My Account",
              press: () {
              }
          ),
          ProfileMenuItem(
              icon: "assets/icons/Bell.svg",
              text: "Notifications",
              press: () {}
          ),
          ProfileMenuItem(
              icon: "assets/icons/Settings.svg",
              text: "Settings",
              press: () {}
          ),
          ProfileMenuItem(
              icon: "assets/icons/Question mark.svg",
              text: "Help Center",
              press: () {}
          ),
          ProfileMenuItem(
              icon: "assets/icons/Log out.svg",
              text: "Log out",
              press: () {}
          ),
        ],
      ),
    );
  }
}




