import 'package:e_commerce_app/components/custom_botton_navbar.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import '../../enums.dart';
import 'components/body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu:MenuState.home),
    );
  }
}
