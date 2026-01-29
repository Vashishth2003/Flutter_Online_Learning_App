import 'package:online_learning_app/model/course.dart';
import 'package:online_learning_app/model/course_category.dart';
import 'package:online_learning_app/model/lecture.dart';
import 'package:online_learning_app/model/section.dart';

class CourseDataProvider {
  static List<Section> sectionList = [
    Section("Introduction", [
      Lecture("Introduction", "01:48 mins"),
      Lecture("What is Flutter", "05:54 mins"),
      Lecture("Understanding Flutter Architecture", "04:45 mins"),
      Lecture("Flutter Alternatives", "06:10 mins"),
    ]),
    Section("Flutter Basics", [
      Lecture("Module Introduction", "02:25 mins"),
      Lecture("Creating New Project", "05:17 mins"),
      Lecture("Dart Basics", "17:20 mins"),
      Lecture("Dart Fundamentals", "11:10 mins"),
      Lecture("Flutter App Basic", "07:40 mins"),
    ]),
  ];

  static List<Course> courseList = [
    Course(
      "1",
      "Flutter Master class",
      "assets/images/course/programming1.png",
      "This complete flutter development course from beginner to expert. Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.",
      "Effortless Code Learning",
      4.2,                          // rate
      false,                        // isFavourite
      CourseCategory.programming,    // category
      100,                           // price
      "2.5 Hours",                   // duration
      "01-Jan-2022",                 // createdDate
      15,                            // lessons
      sectionList,                   // sections
    ),
    Course(
      "2",
      "Flutter with Firebase",
      "assets/images/course/programming4.png",
      "Flutter is Google’s mobile UI open source framework to build high-quality native interfaces for iOS and Android apps.",
      "Effortless Code Learning",
      4.5,
      false,
      CourseCategory.programming,
      50,
      "3 Hours",
      "01-Apr-2022",
      10,
      sectionList,
    ),
    Course(
      "3",
      "Complete Web 3.0",
      "assets/images/course/programming2.png",
      "Become a Blockchain Developer with Ethereum and Solidity! This course introduces decentralized app (Dapp) development.",
      "Perfect Academy",
      5.0,
      false,
      CourseCategory.programming,
      75,
      "2.7 Hours",
      "01-Mar-2022",
      15,
      sectionList,
    ),
    Course(
      "4",
      "Marketing MasterClass",
      "assets/images/course/marketing2.png",
      "You're looking for a complete digital marketing course to teach you everything you need to become a digital marketing expert.",
      "Effortless Code Learning",
      4.7,
      false,
      CourseCategory.marketing,
      80,
      "4.2 Hours",
      "01-Jan-2022",
      21,
      sectionList,
    ),
  ];
}
