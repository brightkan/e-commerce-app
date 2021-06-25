import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/components/rounded_icon_btn.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/Product.dart';
import 'package:e_commerce_app/screens/details/components/product_description.dart';
import 'package:e_commerce_app/screens/details/components/product_image.dart';
import 'package:e_commerce_app/screens/details/components/top_rounded_container.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                    product: product,
                    press: (){}),
                TopRoundedContainer(
                    color: Color(0XFFF6F7F9),
                    child: Column(
                      children: [
                        ColorDots(product: product),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(
                                  SizeConfig.screenWidth * 0.15
                              ),
                            vertical: getProportionateScreenWidth(15)
                          ),
                          child: TopRoundedContainer(
                              color: Colors.white,
                              child: DefaultButton(
                                text: "Add to Cart",
                                press: (){},
                              )),
                        )
                      ],
                    )),

              ],
            ),
          )
        ],
      ),
    );
  }
}







