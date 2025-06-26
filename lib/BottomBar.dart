
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BarAtTheBottom extends StatelessWidget {
  void Function(int)? ontabchange;
   BarAtTheBottom({
    super.key,
    this.ontabchange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabActiveBorder: Border.all(color: Colors.white),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBackgroundColor: Colors.grey.shade100,
        onTabChange: (value) => ontabchange!(value),
       
  
        tabs: const [
          GButton(
            icon: Icons.home,
           text: 'Shop',
          //  backgroundColor: ,
          ),

          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',),

          // GButton( 
        ],
      ),
    );
  }
}
