import 'package:flutter/cupertino.dart';
import 'package:online_learning_app/model/course_category.dart';

class CourseCategoryChangeNotifier extends ChangeNotifier{
  CourseCategory _category = CourseCategory.all;

  CourseCategory get category => _category;

  void changeCategory(CourseCategory category){
    _category = category;
    notifyListeners();
  }
}