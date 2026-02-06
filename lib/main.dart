import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/screens/account/account_screen.dart';
import 'package:online_learning_app/screens/courses/my_course_list.dart';
import 'package:online_learning_app/screens/courses/wishlist_screen.dart';
import 'package:online_learning_app/screens/details/course_details.dart';
import 'package:online_learning_app/screens/home/course_home.dart';
import 'package:online_learning_app/screens/shopping/checkout_screen.dart';
import 'package:online_learning_app/screens/shopping/shopping_cart_screen.dart';
import 'package:online_learning_app/screens/splash/splash_screen.dart';

import 'UI/routes_names.dart';
import 'arguments/checkout_argument.dart';
import 'arguments/course_argument.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          RoutesNames.splash: (context) => const SplashScreen(),
          RoutesNames.courseHome: (context) => const CourseHome(),
          RoutesNames.shoppingCart: (context) => const ShoppingCartScreen(),
          RoutesNames.myCourseList: (context) => const MyCourseList(),
          RoutesNames.wishList: (context) => const WishlistScreen(),
          RoutesNames.account: (context) => const AccountScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == RoutesNames.courseDetails) {
            //Lets create course argument to pass to course details screen
            final args = settings.arguments as CourseArgument;
            return MaterialPageRoute(
              builder: (context) => CourseDetails(course: args.course),
            );
          } else if (settings.name == RoutesNames.checkOut) {
            //Lets create checkout argument to pass data to checkout screen
            final args = settings.arguments as CheckoutArgument;
            return MaterialPageRoute(
              builder: (context) => CheckoutScreen(
                courseList: args.courseList,
                totalPrice: args.totalPrice,
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}

