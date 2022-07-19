import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'food_page_body.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Header Section including Country, City names and search bar icon.
          Container(
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.redAccent,
              ),
              margin: EdgeInsets.only(top: Responsive.height(7.5, context), bottom: Responsive.height(4.5, context)),
              padding: EdgeInsets.only(left: Responsive.height(2.5, context), right: Responsive.height(2.5, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Pakistan"),
                      Row(
                        children: [
                          SmallText(text: 'Karachi'),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Responsive.height(8, context),
                      width: Responsive.width(14, context),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CustomColors.mainAppColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Calling foodpagebody statefull class.
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          )
        ],
      ),
    );
  }
}
