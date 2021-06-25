import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  List<String> errors = [];

  void addError({String error}){
    if(!errors.contains(errors)){
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}){
    if(errors.contains(error)){
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
          buildConfirmPasswordFormField(),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text:"Continue",
            press: (){
              if(_formKey.currentState.validate()){
                // Go to complete Profile Page
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      onSaved: (newValue)=> confirmPassword = newValue,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kPassNullError);
        } else if(password == value){
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
        return null;
      } ,
      validator: (value){
        if(value.isEmpty){
          return "";
        } else if(password != confirmPassword){
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Confirm Password",
          hintText: "Re-enter password",
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue)=> password = newValue,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      onChanged: (value){
        if(value.length >= 8){
          removeError(error: kShortPassError);
        } else if(value.isNotEmpty){
          removeError(error: kPassNullError);
        }
        password = value;
        return null;
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
        } else if(emailValidatorRegExp.hasMatch(value)){
          removeError(error: kInvalidEmailError);
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