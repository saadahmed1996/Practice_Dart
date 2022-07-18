import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/widgets/app_icon.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //For Image.
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              height: 350,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //For Top two icons cart and cross screen.
          Positioned(
            top: 45,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppIcon(icon: Icons.cancel_outlined),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //For Content.
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              height: 350,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    BigText(text: 'Afghani Boti'),
                    SizedBox(height: 10),
                    SmallText(text: 'Enjoy these at any time at any moment'),
                  ],
                ),
              ),
            ),
          ),
          //For increasing and decreasing quantity.
          Positioned(
            left: 55,
            right: 55,
            bottom: 90,
            child: Container(
              height: 50,
              // width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppIcon(
                    icon: Icons.remove,
                    size: 24,
                    iconColor: Colors.white,
                    backgroundColor: CustomColors.mainAppColor,
                  ),
                  SizedBox(width: 10),
                  BigText(
                    text: '\$ 32 X 0',
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  AppIcon(
                    icon: Icons.add_rounded,
                    size: 24,
                    iconColor: Colors.white,
                    backgroundColor: CustomColors.mainAppColor,
                  ),
                ],
              ),
            ),
          ),
          //Footer Favourite and add to cart button.
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 100,
              width: double.maxFinite,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AppIcon(
                      icon: Icons.favorite,
                      iconColor: CustomColors.mainAppColor,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: CustomColors.mainAppColor),
                    child: Center(
                      child: BigText(
                        text: '\$10 | Add to Cart',
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
