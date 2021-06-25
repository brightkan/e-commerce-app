import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.svgPath,
    this.numOfItems=0,
    @required this.press,
  }) : super(key: key);

  final String svgPath;
  final int numOfItems;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset(svgPath),
          ),
          if(numOfItems!=0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: getProportionateScreenWidth(16),
                height: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0XFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(child: Text("$numOfItems",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(10),
                    height: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
            )
        ],
      ),
    );
  }
}
