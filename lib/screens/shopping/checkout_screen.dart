import 'package:csc_picker_plus/csc_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/UI/routes_names.dart';
import 'package:online_learning_app/UI/util.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/data_provider/shopping_cart_data_provider.dart';
import 'package:online_learning_app/screens/shopping/widget/payment_method.dart';
import '../../data_provider/my_course_data_provider.dart';
import '../../model/course.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.courseList, required this.totalPrice});

  final List<Course> courseList;

  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
            "Checkout",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Billing Address",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              SizedBox(
                  height: 10,
              ),
              //We Will be showing country, state & city in billing address
              //To show the dropdowns for that, I am using csc_picker package
              //We need to start the app to load assets from this package
              //Here you can see country dropdown is not enabled.
              //You can see I am selected state & City of respective country
             CSCPickerPlus(
               layout: Layout.vertical,
               flagState: CountryFlag.DISABLE,
               onCountryChanged: (value){},
               onStateChanged: (value){},
               onCityChanged: (value){},
             ),
              SizedBox(
                  height: 20,
              ),
          
              Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Let's create widget for payment methods
              PaymentMethod(),
          
              SizedBox(
                height: 10,
              ),
              //Now lets show course list for final order confirmation
              Text(
                "Order",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child:ListView.builder(
                        itemCount: courseList.length,
                      itemBuilder: (context,index){
                  Course course = courseList[index];
                  return ListTile(
                    leading: Image.asset(
                      course.thumbnailUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      course.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                      trailing: Text("\$${course.price}"),
                  );
                  })
              )
            ],
          ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "\$${totalPrice}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        MyCourseDataProvider.addAllCourses(courseList);
                        ShoppingCartDataProvider.clearCart();
                        Util.showmessage(
                            context, "Your Order Is PLaced Successfully"
                        );
                        Navigator.pushNamed(context, RoutesNames.courseHome);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      child:Text(
                          "Place Order",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                  )
                ],
              ),
            )
        ],
        ),
      ),
    );
  }
}
