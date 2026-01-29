import 'package:flutter/material.dart';
import 'package:online_learning_app/UI/routes_names.dart';
import 'package:online_learning_app/arguments/checkout_argument.dart';
import 'package:online_learning_app/constants.dart';
import 'package:online_learning_app/data_provider/shopping_cart_data_provider.dart';
import 'package:online_learning_app/model/course.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = calculateTotal();
    List<Course> cartCourseList = ShoppingCartDataProvider.shoppingCartCourseList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Top Section (Total Amount) ---
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Total:",
                      style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "\$$totalAmount",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),

              // --- Bottom Section (Promo & List) ---
              // CHANGE HERE: આ Column ને Expanded માં મુકવી પડે
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Promotion",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Tip: Fixed width 300 na badle Expanded vaparvu saru
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter Promo Code",
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox( // Button ne height apva mate
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              foregroundColor: Colors.white, // Text color white
                            ),
                            onPressed: () {},
                            child: const Text("Apply"),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${cartCourseList.length} Courses In List",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Aa Expanded have barabar work karse karan ke parent Column Expanded che
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartCourseList.length,
                        itemBuilder: (context, index) {
                          return createShoppingCartItem(index);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
            //Inside stack lets add container at bottom to show checkout button to
            //Open place order screen

            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: (){
                    //Lets open checkout screen from this button
                    Navigator.pushNamed(context, RoutesNames.checkOut,
                      arguments: CheckoutArgument(cartCourseList, totalAmount)
                    );
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    child: Text(
                        "Checkout",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ),
            )
        ]),
      ),
    );
  }

  //Now Our shopping cart is done lets create checkout screen

  double calculateTotal() {
    return ShoppingCartDataProvider.shoppingCartCourseList
        .fold(0, (old, course) => old + course.price);
  }

  Widget createShoppingCartItem(int index) {
    Course course = ShoppingCartDataProvider.shoppingCartCourseList[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        // Error handling jo image na male to
        leading: Container(
          width: 60,
          height: 60,
          color: Colors.grey.shade200,
          child: Image.asset(
            course.thumbnailUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          ),
        ),
        title: Text(
          course.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade800,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "By ${course.createdBy}",
              style: const TextStyle(color:kBlueColor),
            ),
            SizedBox(
              height: 5,
            ),
        Row(
          children: [
            Flexible(
              child: Text(
                course.duration,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(radius: 3, backgroundColor: Colors.grey),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                "${course.lessonNo} Lessons",
                style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
      ),
        trailing: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$${course.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () {
                setState(() {
                  ShoppingCartDataProvider.deleteCourse(course);
                });
              },
              child: Icon(Icons.delete, size: 20),
            ),
          ],
        ),
      ),

    ),
    );
  }
}