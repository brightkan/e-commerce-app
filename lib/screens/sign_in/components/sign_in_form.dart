import 'dart:developer';

import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/custom_suffix_icon.dart';
import 'forgot_password_text.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}


class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool remember = false;

  void addError({String error}){
    if(!errors.contains(errors)){
      setState(() {
         errors.add(error);
      });
    }
  }

  void removeError({String error}){
    if(errors.contains(errors)){
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(value: remember,
                  activeColor: kPrimaryColor,
                  onChanged:(value){
                    setState(() {
                      remember = value;
                    });
                  }),
              Text("Remembe me"),
              Spacer(),
              ForgotPasswordText(text: "Forgot Password",)
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: "Continue",
              press: (){
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  // If all are valid then go to success screen
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue)=> password = newValue,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kPassNullError);
        } else if(value.length >= 8){
          removeError(error: kShortPassError);
        }
      } ,
      validator: (value){
        if(value.isEmpty){
          addError(error: kPassNullError);
        } else if(value.length < 8){
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Password",
          hintText: "Enter the password",
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
            ),
            child: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg",),
          )
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue)=> email = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kEmailNullError);
          return "";
        } else if(emailValidatorRegExp.hasMatch(value)){
          removeError(error: kInvalidEmailError);
          return "";
        }
      }
      ,
      validator: (value){
        if(value.isEmpty){
          addError(error: kEmailNullError);
          return "";
        } else if(!emailValidatorRegExp.hasMatch(value)){
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Email",
          hintText: "Enter the email here",
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
            ),
            child: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",),
          )
      ),
    );
  }
}

