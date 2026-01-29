import 'package:flutter/material.dart';
import 'package:online_learning_app/component/bottom_option.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/screens/home/widget/category_course_list.dart';
import 'package:online_learning_app/screens/home/widget/category_list.dart';
import 'package:online_learning_app/screens/home/widget/course_list.dart';
import 'package:online_learning_app/screens/home/widget/course_search.dart';
import 'package:online_learning_app/screens/home/widget/featured_courses.dart';
import 'package:online_learning_app/screens/home/widget/header.dart';
import 'package:online_learning_app/screens/home/widget/offers.dart';

import '../../component/shopping_cart_option.dart';

class CourseHome extends StatelessWidget {
  const CourseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              height: 170,
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Header(),
                    SizedBox(
                      height: 10,
                    ),
                    CourseSearch(),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Offers(),
                  FeaturedCourses(),
                  CategoryCourseList(),
                ],
              ),
            )
          ],
                ),
        ),
    ),
      floatingActionButton: ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomOption(selectedIndex: 1,),
    );
  }
}
