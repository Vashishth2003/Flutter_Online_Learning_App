import 'package:flutter/material.dart';
import 'package:online_learning_app/data_provider/course_data_provider.dart';
import 'package:online_learning_app/model/course_category.dart';
import 'package:online_learning_app/notifier/course_Category_Change_Notifier.dart';
import 'package:online_learning_app/screens/home/widget/course_item.dart';
import 'package:provider/provider.dart';

import '../../../model/course.dart';
import 'course_item.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  //Now we have shown all courses, Lets change course list based on the selected category
  //For that we will be using provider pattern, Lets add provider package dependency
  //In pubspec.yaml file.
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
      physics: ScrollPhysics(),
      children: getCourseList(context).map((course){
        return CourseItem(course: course);
      }).toList(),
    );
  }
  List<Course> getCourseList(BuildContext context){
    //Lets get selected category using provider
    var category = Provider.of<CourseCategoryChangeNotifier>(context).category;

    if(category == CourseCategory.all){
      return CourseDataProvider.courseList;
    }
    return CourseDataProvider.courseList
        .where((course) => course.courseCategory == category)
        .toList();
  }

  //So far we have shown header, offers, featured courses & courses with catefories, on home screen,
  //Now lets shown bottom navigation bar
}
