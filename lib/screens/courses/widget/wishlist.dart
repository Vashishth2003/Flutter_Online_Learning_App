import 'package:flutter/material.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/data_provider/course_data_provider.dart';

import '../../../model/course.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    List<Course> courseList = getCourseList(context);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: courseList.length,
        itemBuilder: (context,index){
      Course course = courseList[index];
      //Lets Create another function to create list item & call here
      return getListItem(course);
    });
  }

  //Lets create function to filter list based on isFavourite flag
  List<Course> getCourseList(BuildContext context){
    return CourseDataProvider.courseList
        .where((course) => course.isFavourite)
        .toList();
  }

  Widget getListItem(Course course){
    return Card(
      child: ListTile(
        leading: Image.asset(
            course.thumbnailUrl,
            width: 65,
            height: 65,
            fit: BoxFit.cover,
        ),
        //Seems no data in wishlist, lets add wishlist items first.
        //I will add bottom navigation bar here, so we can navigate to course screen
        //To add in wishlist
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade800,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "By ${course.createdBy}",
              style: TextStyle(
                color: kBlueColor,
                fontSize: 13,
              ),
            ),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${course.lessonNo} Lessons",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),

                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${course.rate}")
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "\$${course.price}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(), // 🔥 instead of SizedBox
                InkWell(
                  onTap: () {
                    setState(() {
                      course.isFavourite = false;
                    });
                  },
                  child: Icon(Icons.delete),
                )
              ],
            ),

          ],
        ),
      )
    );
  }
}
