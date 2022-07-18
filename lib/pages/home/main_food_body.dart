import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'food_page_body.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //Header Section including Country, City names and search bar icon.
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
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
                        height: 45,
                        width: 45,
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
      ),
    );
  }
}
