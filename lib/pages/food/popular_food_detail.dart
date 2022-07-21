import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/app_icon.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/icon_plus_text.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //First Container for half of the screen aling with image and two icons.
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Responsive.height(45, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //Positioning for two icons.
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppIcon(icon: Icons.arrow_back),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //Mid content for food detail.
          Positioned(
            left: 0,
            right: 0,
            bottom: 5,
            //Content Container for food details
            child: Container(
              height: Responsive.height(60, context),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Sindhi Mutton Biryani Masala'),
                    SizedBox(height: Responsive.height(1.2, context)),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: CustomColors.mainAppColor,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: Responsive.width(4, context)),
                        SmallText(text: '4.5'),
                        SizedBox(width: Responsive.width(4, context)),
                        SmallText(text: '1297'),
                        SizedBox(width: Responsive.width(4, context)),
                        SmallText(text: 'Comments'),
                      ],
                    ),
                    SizedBox(height: Responsive.height(3.5, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconPlusText(
                          text: 'Normal',
                          icon: Icons.circle_sharp,
                          iconColor: CustomColors.mainAppColor,
                        ),
                        IconPlusText(
                          text: '1.7km',
                          icon: Icons.location_on,
                          iconColor: CustomColors.mainAppColor,
                        ),
                        IconPlusText(
                          text: '12min',
                          icon: Icons.access_time_rounded,
                          iconColor: CustomColors.mainAppColor,
                        ),
                      ],
                    ),
                    SizedBox(height: Responsive.height(3.5, context)),
                    BigText(text: 'Food Detail:'),
                    SizedBox(height: Responsive.height(3.5, context)),
                    SmallText(
                        text:
                            'Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),
                  ],
                ),
              ),
            ),
          ),
          //Footer container for quantity and add to cart button
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: Responsive.height(15, context),
              width: double.maxFinite,
              margin: EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Responsive.height(8.5, context),
                    width: Responsive.width(30, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white38,
                      //white38
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppIcon(
                          icon: Icons.remove,
                          size: 20,
                        ),
                        BigText(
                          text: '0',
                          color: Colors.black38,
                        ),
                        AppIcon(
                          icon: Icons.add,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Responsive.height(9, context),
                    width: Responsive.width(40, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomColors.mainAppColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: BigText(
                          text: '\$ 12 | Add to Cart',
                          size: 15,
                          color: Colors.white,
                        ),
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
