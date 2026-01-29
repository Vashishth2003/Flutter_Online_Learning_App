import 'package:flutter/material.dart';
import 'package:online_learning_app/data_provider/course_data_provider.dart';
import 'package:online_learning_app/model/course.dart';
import 'package:online_learning_app/screens/home/widget/course_item.dart';

class FeaturedCourses extends StatelessWidget {
  const FeaturedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Safe & Dynamic way – Only take available courses (max 5)
    List<Course> featuredCourseList = CourseDataProvider.courseList.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Courses",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            InkWell(
              onTap: () {
                // TODO: Navigate to All Courses Page
              },
              child: const Text(
                "See All",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // 🔹 Horizontal Scroll List of Courses
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredCourseList.length,
            itemBuilder: (context, index) {
              Course course = featuredCourseList[index];
              //Lets create separate widget to show course details.We Will be using
              //widget for other features too
              //so far we have shown featured courses. now lets show category List
              return CourseItem(course: course);
            },
          ),
        ),
      ],
    );
  }
}
