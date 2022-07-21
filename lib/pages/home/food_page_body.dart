import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/food/recommended_food_detail.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/icon_plus_text.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../food/popular_food_detail.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //To make a next and previous slide visible from left to right.
  PageController pageController = PageController(viewportFraction: 0.85);
  final _currentPageValue = 0.0;
  @override
  Widget build(BuildContext context) {
    // print("height" + MediaQuery.of(context).size.height.toString());
    // print("width" + MediaQuery.of(context).size.width.toString());
    // print('screen size' + MediaQuery.of(context).size.toString());
    return Column(
      children: [
        //Slider Section
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PopularFoodDetail(),
              ),
            );
          },
          child: Container(
            //For debuging purpose.
            //color: Colors.redAccent,
            height: Responsive.height(55, context),
            //height: 320,
            //Using page view to build a slider.
            child: PageView.builder(
              controller: pageController,
              //this defines how many slides an app can have.
              itemCount: 5,
              //Item builder takes two parameters context or the index.
              itemBuilder: ((context, index) {
                return _buildVerticalPageItem(index);
              }),
            ),
          ),
        ),
        //Dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: CustomColors.mainAppColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(height: Responsive.height(5, context)),
        //Showing middle text
        Container(
          margin: EdgeInsets.only(left: Responsive.height(4.5, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommendations'),
              SizedBox(width: Responsive.width(2.5, context)),
              Container(
                margin:
                    EdgeInsets.only(bottom: Responsive.height(0.5, context)),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Responsive.width(2.8, context)),
              Container(
                margin:
                    EdgeInsets.only(bottom: Responsive.height(0.2, context)),
                child: SmallText(text: 'Food List'),
              ),
            ],
          ),
        ),
        SizedBox(height: Responsive.height(4, context)),
        //Showing food list vertically.
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecommendedFoodDetail(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Row(
                    children: [
                      //Image section.
                      Container(
                        width: Responsive.width(32, context),
                        height: Responsive.height(19, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/food0.png'),
                          ),
                        ),
                      ),
                      //Food detail on left side.
                      //Expanded widget takes all the available space.
                      Expanded(
                        child: Container(
                          height: Responsive.height(17, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: 'Mutton Handi'),
                                SizedBox(
                                    height: Responsive.height(1.8, context)),
                                SmallText(text: 'With all characteristics'),
                                SizedBox(
                                    height: Responsive.height(1.5, context)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }

  //Building a fucntion for slider.
  Widget _buildVerticalPageItem(int index) {
    //Using stack widget to overlap containers and position them.
    return Stack(
      children: [
        //Fist big container with the image.
        Container(
          height: Responsive.height(34, context),
          //height: 220,
          margin: EdgeInsets.only(
              left: Responsive.height(1.5, context),
              right: Responsive.height(1.5, context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //Using two colors with the help of ternary operator.
            color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
            image: const DecorationImage(
              image: AssetImage('assets/image/food0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //Using align widget to align the second container at the bottom center.
        Align(
          alignment: Alignment.bottomCenter,
          //Second container for dish rating and reviews.
          child: Container(
            height: Responsive.height(21, context),
            //height: 120,
            margin: EdgeInsets.only(
                left: Responsive.height(3, context),
                right: Responsive.height(3, context),
                bottom: Responsive.height(3, context)),
            //using decoration box to round the container from the edges and give it a color.
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 140, 140, 140),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: Responsive.height(3, context),
                  left: Responsive.height(3, context),
                  right: Responsive.height(3, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //1st section of the 2nd container.
                  BigText(text: 'Sindhi Mutton Biryani Masala'),
                  SizedBox(height: Responsive.height(1.5, context)),
                  //2nd section of the 2nd container.
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: CustomColors.mainAppColor,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: Responsive.width(2.5, context)),
                      SmallText(text: '4.5'),
                      SizedBox(width: Responsive.width(2.5, context)),
                      SmallText(text: '1297'),
                      SizedBox(width: Responsive.width(2.5, context)),
                      SmallText(text: 'Comments'),
                    ],
                  ),
                  SizedBox(height: Responsive.height(3.5, context)),
                  //3rd section of the 2nd container.
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
