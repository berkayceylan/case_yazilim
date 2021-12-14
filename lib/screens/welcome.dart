import 'dart:ffi';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/icon_text_card.dart';
import 'package:flutter_project/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0XFF00d2ff), Color(0xFF928DAB)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  IconTextCard(icon: FontAwesomeIcons.home, text: "Anasayfa"),
                  IconTextCard(
                      icon: FontAwesomeIcons.addressCard, text: "Hakkımızda"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  IconTextCard(
                      icon: FontAwesomeIcons.tasks, text: "Projelerimiz"),
                  IconTextCard(
                      icon: FontAwesomeIcons.users, text: "Referanslarımız"),
                ],
              ),
            ],
          ),
              Container(color: Colors.red,),
              Container(color: Colors.green,),
              Container(color: Colors.blue,),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController!.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: const Text('Anasayfa'),
                icon: const Icon(Icons.home)
            ),
            BottomNavyBarItem(
                title: const Text('Hakkımızda'),
                icon: const Icon(Icons.apps)
            ),
            BottomNavyBarItem(
                title: const Text('Projelerimiz'),
                icon: const Icon(Icons.chat_bubble)
            ),
            BottomNavyBarItem(
                title: const Text('Referanslarımız'),
                icon: const Icon(Icons.settings)
            ),
          ],
        ),
      ),
    );
  }
}
