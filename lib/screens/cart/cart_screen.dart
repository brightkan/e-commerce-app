import 'package:e_commerce_app/components/default_button.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/Cart.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text("Your Cart", style: TextStyle(
              color: Colors.black
          )),
          Text("${demoCartItems.length} Items", style: Theme.of(context).textTheme.caption)
        ],
      ),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
          vertical: getProportionateScreenWidth(15)
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          ),
          boxShadow: [
            BoxShadow(
                offset:Offset(0,-15),
                blurRadius: 20,
                color: Color(0XFFDADADA).withOpacity(0.15)
            ),
          ]
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0XFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add Voucher Code"),
                SizedBox(width: getProportionateScreenWidth(10)),
                Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor)
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                    TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(text: "\$337.15",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: Colors.black
                              ))
                        ]
                    )
                ),
                SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                        text: "Check Out",
                        press: (){}
                    )
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
