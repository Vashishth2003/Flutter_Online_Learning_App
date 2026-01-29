import 'package:flutter/material.dart';
import 'package:online_learning_app/constants.dart';
import '../UI/util.dart';

class ShoppingCartOption extends StatelessWidget {
  const ShoppingCartOption({super.key});

  @override
  Widget build(BuildContext context) {
  return FloatingActionButton(
      backgroundColor: kPrimaryColor,
        onPressed:(){
          //We Will Open shopping Cart Screen
          Util.openShoppoingCart(context);
        },
        child: Icon(
            Icons.shopping_cart,
          color: Colors.white,
        ),
  );
  }
}
