import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(10)
      ),
      child: TextButton(onPressed: press,
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              backgroundColor: Color(0XFFF5F6F9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon,
                width: 22,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Expanded(child: Text(text,
                  style: Theme.of(context).textTheme.bodyText1)),
              Icon(Icons.arrow_forward_ios, color: Colors.black,)
            ],
          )),
    );
  }
}