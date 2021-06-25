import 'package:e_commerce_app/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SectionTitle(text: "Special for you", press: (){}),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SpecialOfferCard(
                  category: "Smartphones",
                  imagePath: "assets/images/Image Banner 2.png",
                  press: (){},
                  numOfBrands: 18,
                ),
                SpecialOfferCard(
                  category: "Fashion",
                  imagePath: "assets/images/Image Banner 3.png",
                  press: (){},
                  numOfBrands: 24,
                ),
                SizedBox(width: getProportionateScreenWidth(20))
              ],
            ),
          )
        ]
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.imagePath,
    @required this.press,
    this.numOfBrands=0,
  }) : super(key: key);

  final String category,imagePath;
  final int numOfBrands;
  final GestureTapCallback press;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(imagePath,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0XFF343434).withOpacity(0.4),
                            Color(0XFF343434).withOpacity(0.15),
                          ])
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(10)
                  ),
                  child: Text.rich(
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(text: "$category\n",
                                style:TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            TextSpan(text: "$numOfBrands brands")
                          ]
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}