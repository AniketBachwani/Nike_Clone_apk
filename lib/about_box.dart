import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class AboutBox extends StatelessWidget {
  const AboutBox({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: const Text(
        "About Developer",
        style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              children: [
                const TextSpan(
                  text: 'This app is developed by Aniket Bachwani \n\n',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const TextSpan(
                    text: 'Tap these Links to know more about me :',
                    style:
                        TextStyle(color: Colors.white, fontSize: 16)),
                TextSpan(
                  text: "\n\nLinkedIn",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _launchURL(
                        "https://www.linkedin.com/in/aniket-bachwani-16167728b/"),
                ),
                TextSpan(
                  text: "\nGithub",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 18),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        _launchURL("https://github.com/AniketBachwani"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
