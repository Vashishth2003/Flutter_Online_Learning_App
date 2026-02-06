import 'package:flutter/material.dart';
import 'package:online_learning_app/UI/routes_names.dart';
import 'package:online_learning_app/constants.dart';

class BottomOption extends StatelessWidget {
  const BottomOption({super.key, required this.selectedIndex});

  final int selectedIndex;
//Lets Show shopping cart option in the center of bottom navigation bar using notch
  //So far we have done with home screen, now lets show Course details screen
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                //On click of this option we will open respective screen
                openScreen(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: getSelectedColor(1),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 13,
                        color: getSelectedColor(1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //On click of this option we will open respective screen
                openScreen(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.play_circle_outline,
                      color: getSelectedColor(2),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "My Courses",
                      style: TextStyle(
                        fontSize: 13,
                        color: getSelectedColor(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //On click of this option we will open respective screen
                openScreen(context, 3);
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: getSelectedColor(3),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "WishList",
                      style: TextStyle(
                        fontSize: 13,
                        color: getSelectedColor(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //On click of this option we will open respective screen
                openScreen(context, 4);
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.people,
                      color: getSelectedColor(4),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 13,
                        color: getSelectedColor(4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getSelectedColor(int optionIndex) {
    return (selectedIndex == optionIndex) ? kPrimaryColor : Colors.grey.shade800;
  }

  void openScreen(BuildContext context, int selectedOptionNo) {
    String routeName = RoutesNames.courseHome;
    switch (selectedOptionNo) {
      case 1:
        routeName = RoutesNames.courseHome;
        break;
      case 2:
        routeName = RoutesNames.myCourseList;
        break;
      case 3:
        routeName = RoutesNames.wishList;
        break;
      case 4:
        routeName = RoutesNames.account;
        break;
    }
    Navigator.pushReplacementNamed(context, routeName);
  }
}

