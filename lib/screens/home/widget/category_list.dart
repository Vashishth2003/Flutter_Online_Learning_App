import 'package:flutter/material.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/model/course_category.dart';
import 'package:online_learning_app/notifier/course_Category_Change_Notifier.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    //Get selected category using provider
    var category = Provider.of<CourseCategoryChangeNotifier>(context).category;
    //Lets use this category variable to highlight selected category
    //Now we have highlighted selected category, lets change course list based on category selection
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.grey.shade800,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //Lets Shown category list in horizontal list
        
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: CourseCategory.values.length,
              itemBuilder: (context,index){
                CourseCategory courseCategory = CourseCategory.values[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      Provider.of<CourseCategoryChangeNotifier>(context,
                        listen: false).changeCategory(courseCategory);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: category == courseCategory ? kPrimaryColor
                            :Colors.white,
                        border: Border.all(color: Colors.grey.shade900),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          courseCategory.title,
                          style: TextStyle(
                            fontSize: 15,
                            color: category == courseCategory
                                ?Colors.white
                                :Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                );
          }
          ),
        ),
        //We have shown category List, Now lets show all course list
        //We Will change course list as per category once we show the course list
      ],
    );
  }
}
