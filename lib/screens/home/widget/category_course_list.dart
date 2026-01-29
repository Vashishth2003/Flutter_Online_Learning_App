import 'package:flutter/material.dart';
import 'package:online_learning_app/notifier/course_Category_Change_Notifier.dart';
import 'package:provider/provider.dart';

import 'category_list.dart';
import 'course_list.dart';

class CategoryCourseList extends StatelessWidget {
  const CategoryCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CourseCategoryChangeNotifier(),
        child: Column(
          children: [
            CategoryList(),
            CourseList(),
          ],
        ),
    );
  }
}
