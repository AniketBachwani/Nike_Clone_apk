// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Intro_page.dart';


class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  // Function to launch URLs
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 26, 27),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/Login.png",
              height: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
            child: Text(
              "Enter your email to join us or sign in.",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: const Color.fromARGB(255, 24, 26, 27),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'Email*',
                  style: TextStyle(color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                children: [
                  const TextSpan(text: "By continuing, I agree to Nike’s "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchURL(
                          "https://agreementservice.svs.nike.com/rest/agreement?agreementType=privacyPolicy&country=IN&language=en&requestType=redirect&uxId=4fd2d5e7db76e0f85a6bb56721bd51df"),
                  ),
                  const TextSpan(text: " and "),
                  TextSpan(
                    text: "Terms of Use",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchURL(
                          "https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&country=IN&language=en&requestType=redirect&uxId=4fd2d5e7db76e0f85a6bb56721bd51df"),
                  ),
                  const TextSpan(text: "."),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, right: 25),
            child: Align(
              alignment: Alignment.centerRight,
              child: AnimatedButton(
                onPress: () async {
                  await Future.delayed(
                    const Duration(
                        milliseconds:
                            440), // Adjust to match animation duration
                  );

                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntroPage(),
                    ),
                  );
                },
                height: 50,
                width: 100,
                text: 'Continue',
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
