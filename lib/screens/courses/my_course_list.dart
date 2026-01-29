import 'package:flutter/material.dart';
import 'package:online_learning_app/component/bottom_option.dart';
import 'package:online_learning_app/component/shopping_cart_option.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/data_provider/my_course_data_provider.dart';
import 'package:online_learning_app/screens/shopping/shopping_cart_screen.dart';
import '../../model/my_course.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    List<MyCourse> myCourseList = MyCourseDataProvider.myCourse;

    if(myCourseList.isNotEmpty){
      myCourseList[1].progress=50;
      myCourseList[2].progress=20;
    }
    return Scaffold(
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "My Courses",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          alignment:Alignment.center,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey.shade900),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "All Courses",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          alignment:Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey.shade900),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Downloaded Courses",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          alignment:Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey.shade900),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Archived Courses",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Now Let's Show User's Course List
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                    itemCount: myCourseList.length,
                    itemBuilder: (context, index){
                      MyCourse myCourse = myCourseList[index];
                      return getMyCourse(myCourse, context);
                    },
                ))
              ],
            ),
          )
      ),

      floatingActionButton: ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomOption(selectedIndex: 2),
    );
  }

  Widget getMyCourse(MyCourse myCourse, BuildContext context){
    return Card(
      child: ListTile(
        leading: Image.asset(myCourse.course.thumbnailUrl),
        title: Text(
          myCourse.course.title,
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
              myCourse.course.createdBy,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(
                height: 10
            ),
            Visibility(
                visible: myCourse.progress > 0,
                replacement: Text(
                  "Start Course",
                  style: TextStyle(
                    color: kBlueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child:Row(
                  children: [
                    Expanded(
                        child: SliderTheme(data: SliderTheme.of(context).copyWith(
                          trackHeight: 3,
                          thumbColor: Colors.transparent,
                          overlayShape: SliderComponentShape.noThumb,
                          thumbShape: SliderComponentShape.noThumb,
                        ), 
                            child: Slider(
                              min: 0,
                                max: 100,
                                value: myCourse.progress.toDouble(),
                                onChanged: (val){}
                            )
                        )
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                        "${myCourse.progress}%"
                    ),
                  ],
                ),
            ),

            //If Course is already started by User, show course progress

          ],
        )
      ),
    );
  }
}
