// ignore_for_file: file_names

import 'package:currency_convertor/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: Image.asset('assets/Nike.png', height: 240),
            ),

            const SizedBox(
              height: 48,
            ),

            //tittle
            const Text(
              'Just Do It',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(
              height: 24,
            ),

            //sub tittle
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Step Up Your Style: Your Ultimate Nike Sneakers Shopping Companion",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(
              height: 48,
            ),

            //start now button
            AnimatedButton(
              onPress: () async {
                // Wait for the animation to complete
                await Future.delayed(
                  const Duration(
                      milliseconds: 440), // Adjust to match animation duration
                );

                // Navigate to the HomePage
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              height: 70,
              width: 200,
              text: 'SHOP NOW',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
              backgroundColor: Colors.black,
              borderColor: Colors.white,
              borderRadius: 50,
              borderWidth: 2,
            ),
          ],
        )
        );
  }
}
