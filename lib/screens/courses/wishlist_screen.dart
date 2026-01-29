import 'package:flutter/material.dart';
import 'package:online_learning_app/screens/courses/widget/wishlist.dart';

import '../../component/bottom_option.dart';
import '../../component/shopping_cart_option.dart';
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "WishList",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Lets show wishlist here, so creating new widget for this
                Wishlist()
              ],
            ),
          )
      ),
      floatingActionButton: ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomOption(selectedIndex: 3),
    );
  }
}
