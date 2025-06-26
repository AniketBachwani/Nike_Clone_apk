// ignore_for_file: file_names

import 'package:currency_convertor/BottomBar.dart';
import 'package:currency_convertor/cart.dart';
import 'package:currency_convertor/shop.dart';
import 'package:flutter/gestures.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
    const Placeholder()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BarAtTheBottom(
        ontabchange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  'assets/Nike.png',
                  color: Colors.white,
                )),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                backgroundColor: Colors.black,
                                title: const Text(
                                  "About Developer",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Column(
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
                                            text:
                                                'This app is developed by Aniket Bachwani \n\n',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          const TextSpan(
                                              text:
                                                  'Tap these Links to know more about me :',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
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
                                                color: Colors.white,
                                                fontSize: 18),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () => _launchURL(
                                                  "https://github.com/AniketBachwani"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                    },
                    child: const ListTile(
                      leading: Icon(Icons.info, color: Colors.white),
                      title: Text(
                        'About',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
