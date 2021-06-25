import 'package:e_commerce_app/models/Cart.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_item_card.dart';


class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemCount: demoCartItems.length,
          itemBuilder: (context,index)=>
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(10)
                ),
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(index.toString()),
                  background: Container(
                    padding:
                    EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                        color: Color(0XFFFFE6E6),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg")
                      ],
                    ),
                  ),
                  child: CartItemCard(cartItem: demoCartItems[index]),
                  onDismissed: (direction){
                    setState(() {
                      demoCartItems.removeAt(index);
                    });
                  },
                ),
              )),
    );
  }
}


