import 'package:e_commerce_app/components/rounded_icon_btn.dart';
import 'package:e_commerce_app/models/Product.dart';
import 'package:e_commerce_app/size_config.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';




class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final ProductDetailsArgument arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0XFFF5F6F9),
      appBar: CustomAppBar(rating:arguments.product.rating),
      body: Body(product: arguments.product),
    );
  }
}


class CustomAppBar extends PreferredSize {

  final double rating;

  CustomAppBar({this.rating=0.0});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(icon: Icons.arrow_back_ios, press: (){
              Navigator.pop(context);
            }),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(14),
                  vertical: getProportionateScreenWidth(5)
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Text(rating.toString(), style: TextStyle(
                      fontWeight: FontWeight.w600
                  )),
                  const SizedBox(width: 5,),
                  SvgPicture.asset("assets/icons/Star Icon.svg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



// We also need to pass our product to our details screen
// We use named route so we need to create arguments class
class ProductDetailsArgument {
  final Product product;
  ProductDetailsArgument({@required this.product});
}