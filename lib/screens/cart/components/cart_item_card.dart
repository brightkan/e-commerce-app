import 'package:e_commerce_app/models/Cart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required this.cartItem,
  }) : super(key: key);
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0XFFF5F6F9),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset(cartItem.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(29)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cartItem.product.title,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Text.rich(
                TextSpan(text: "\$${cartItem.product.price}",
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                    children: [
                      TextSpan(text:" x${cartItem.numberOfItems}",
                          style: TextStyle(
                              color: kTextColor
                          ))
                    ]
                )
            )
          ],
        )
      ],
    );
  }
}