import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/icon_plus_text.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
    return Column(
      children: [
        //Slider Section
        Container(
          //For debuging purpose.
          //color: Colors.redAccent,
          height: 320,
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
        const SizedBox(height: 30),
        //Showing middle text
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommendations'),
              const SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food List'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        //Showing food list vertically.
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  children: [
                    //Image section.
                    Container(
                      width: 120,
                      height: 120,
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
                        height: 100,
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
                              SizedBox(height: 10),
                              SmallText(text: 'With all characteristics'),
                              SizedBox(height: 10),
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
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //Using two colors with the help of ternary operator.
            color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
            image: const DecorationImage(
              image: AssetImage('assets/image/food1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //Using align widget to align the second container at the bottom center.
        Align(
          alignment: Alignment.bottomCenter,
          //Second container for dish rating and reviews.
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            //using decoration box to round the container from the edges and give it a color.
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //1st section of the 2nd container.
                  BigText(text: 'Sindhi Mutton Biryani Masala'),
                  const SizedBox(height: 10),
                  //2nd section of the 2nd container.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      const SizedBox(width: 10),
                      SmallText(text: '4.5'),
                      const SizedBox(width: 10),
                      SmallText(text: '1297'),
                      const SizedBox(width: 10),
                      SmallText(text: 'Comments'),
                    ],
                  ),
                  const SizedBox(height: 20),
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
