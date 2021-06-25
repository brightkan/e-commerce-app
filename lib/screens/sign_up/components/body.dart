import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/components/social_cards.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenWidth * 0.03),
              Text(
                "Register Account",
                style: headingTextStyle,
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenWidth * 0.07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenWidth * 0.07),
              SocialCards(),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text("By continuing, you confirm that you agree with our terms and "
                  "conditions", textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}


