import 'package:get/get.dart';

class DimensionsGetx {

  //Height 731.42/220 = 3.32;
  //Width 411.42/120 = 3.42;

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //Containers height
  static double pageView = screenHeight / 2.28;
  static double pageViewContainer = screenHeight / 3.32;
  
  //Page view text
  static double pageViewText = screenHeight / 6.09;

  //dynamic Height Padding & Margin
  static double height10 = screenHeight / 73.142;
  static double height15 = screenHeight / 48.76;
  static double height20 = screenHeight / 36.571;
  static double height30 = screenHeight / 24.38;
  static double height45 = screenHeight / 16.25;
  

  //dynamic Width Padding & Margin
  static double width10 = screenHeight / 73.142;
  static double width15 = screenHeight / 48.76;
  static double width20 = screenHeight / 36.571;
  static double width30 = screenHeight / 24.38;
  static double width45 = screenHeight / 16.25;

  //font size
  static double font16 = screenHeight / 45.71;
  static double font20 = screenHeight / 36.571;
  static double font26 = screenHeight / 28.13;

  //circle radius
  static double radius15 = screenHeight / 48.76;
  static double radius20 = screenHeight / 36.571;
  static double radius30 = screenHeight / 24.38;

  //Icon Size
  static double iconSize24 = screenHeight / 30.47;
  static double iconSize16 = screenHeight / 45.71;
  static double iconSize72 = screenHeight / 10.15; 
  static double iconSize96 = screenHeight / 7.61;
  
  //List View Size
  static double listViewImgSize = screenWidth / 3.42;
  static double listViewTextContainerSize = screenWidth / 4.11;

  //Popular food
  static double popularFoodImgSize = screenHeight / 2.08;

  //bottom height
  static double bottomHeightBar = screenHeight / 6.09;

  //User Profile View Container
  static double userProfileViewContainer = screenHeight / 9.75;

}