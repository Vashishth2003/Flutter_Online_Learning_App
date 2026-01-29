import 'package:flutter/material.dart';
import 'package:online_learning_app/UI/util.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/model/section.dart';
import 'package:online_learning_app/screens/details/widget/favourite_option.dart';
import 'package:readmore/readmore.dart';

import '../../UI/routes_names.dart';
import '../../arguments/checkout_argument.dart';
import '../../data_provider/shopping_cart_data_provider.dart';
import '../../model/course.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key, required this.course});

  final Course course;
  @override
  Widget build(BuildContext context) {
    var greyTextStyle = TextStyle(fontSize: 15,color: Colors.grey.shade600);
    return Scaffold(
      body: SafeArea(
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      Util.openShoppoingCart(context);
                                    },
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                        ClipRRect(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(course.thumbnailUrl)),

                          Column(
                            children: [
                              Icon(
                                  Icons.play_arrow,
                                  size: 90,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Preview this course",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                                course.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            SizedBox(
                                height: 10
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: kBlueColor,
                                    ),
                                    SizedBox(
                                        width: 10
                                    ),
                                    Text(
                                      course.createdBy,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kBlueColor,
                                      ),
                                    )
                                  ],
                                ),
                                //Now lets show favourite option
                                //For that lets create new widget
                                FavouriteOption(course:course)
                              ],
                            ),

                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.play_circle_outline),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${course.lessonNo} Lessons',
                                      style: greyTextStyle,
                                    )
                                  ],
                                ),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      course.duration,
                                      style: greyTextStyle,
                                    )
                                  ],
                                ),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${course.rate}',
                                      style: greyTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 10
                            ),
                            ReadMoreText(
                              course.description,
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "Show more",
                              trimExpandedText: "Show less",
                              moreStyle:TextStyle(
                                color: kBlueColor,
                                fontWeight: FontWeight.bold,
                              ),
                              lessStyle:TextStyle(
                                color: kBlueColor,
                                fontWeight: FontWeight.bold,
                              ),
                              style:TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                                height: 20
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text(
                                      "Course Content",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                Text(
                                  "(${course.sections.length} Sections)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                )
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                                itemCount: course.sections.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return buildCourseContent(index);
                                },
                            )
                          ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${course.price}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor),
                                  onPressed: (){
                                        String message = "Course Is Already Added Into Cart";
                                        if(!ShoppingCartDataProvider.shoppingCartCourseList.contains(course)){
                                          message = "Course Is Added Into Cart";
                                          ShoppingCartDataProvider.addCourse(course);
                                        }
              
                                        //Lets show Message in snackbar, so lets create snackbar utility method first
                                    Util.showmessageWithAction(context, message, "View", (){
                                      //Lets Open Shopping Cart List Here
                                      Util.openShoppoingCart(context);
                                    });
                                        //Now Lets Create Shopping Crat List
              
                                  },
                                  child: Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                              ),
                              SizedBox(width: 10),
              
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor),
                                onPressed: (){
                                  //On click of Buy Button, lets show checkout screen to
                                  //buy single course
                                  Navigator.pushNamed(context, RoutesNames.checkOut,
                                      arguments: CheckoutArgument([course],course.price));
                                  //Lets select another course as this course is already purchase
                                  //and buy this new course using buy button
                                  //You can see new Course is added in my course list
                                },
                                child: Text(
                                  "Buy",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
                        ),
            )
  )
        //So far we have shown details of course but now we need to show course price
        //and checkout buttons, so lets add code for that
    );
  }
  //Lets write method to build course content

Widget buildCourseContent(int index){
    Section section = course.sections[index];
    return ExpansionTile(
        title: Text("Section ${index + 1} - ${section.name}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      children:
        section.lectures.map((lecture){
          return ListTile(
            dense: true,
            onTap: (){},
            leading: SizedBox(),
            title: Text(lecture.name),
            subtitle: Row(
              children: [
                Icon(
                    Icons.access_time,
                    size: 15,
                ),
                SizedBox(
                    width: 10
                ),
                Text(
                  lecture.duration,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          );
        }).toList()
    );
}
}
