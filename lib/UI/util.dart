import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Util{

  static void showmessage(BuildContext context, String message){

      showmessageWithAction(context, message, null, null);
  }
  static void showmessageWithAction(BuildContext context, String message,
      String? actionLabel, VoidCallback? onPressed){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.grey.shade900,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        action: actionLabel != null
            ? SnackBarAction(
            label: actionLabel,
            onPressed:onPressed!)
            :null,
        content:Text(
            message,
          style: TextStyle(
              color: Colors.white,
              fontSize: 17
          ),
        ),
    ),
    );
  }
  static void openShoppoingCart(BuildContext context){
    Navigator.pushNamed(context, "/shoppingCart");
  }
}