import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:now/src/pages/auth/auth_page.dart';
import 'package:now/src/pages/card/card_page.dart';
import 'package:now/src/pages/home/home_page.dart';
import 'package:now/src/pages/notifications/notifications_page.dart';
import 'package:now/src/pages/profile/profile_page.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPage = 0;
  var _pages = [
    HomePage(),
    Container(),
    CardPage(),
    AuthenticatePage(),
    ProfilePage(),
  ];

  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  _saveDeviceToken() async {
    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (fcmToken != null) {
      print(fcmToken + 'lambiengcode');
    }
  }

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        _saveDeviceToken();
      });

      _fcm.requestNotificationPermissions(IosNotificationSettings());
    } else {
      _saveDeviceToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentPage,
          onTap: (i) {
            setState(() {
              currentPage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: _size.width / 15.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFFC4985B),
          unselectedItemColor: Color(0xFF969696),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Feather.home), title: Text("Dashboard")),
            BottomNavigationBarItem(
                icon: Icon(Feather.clipboard), title: Text("Feed")),
            BottomNavigationBarItem(
                icon: Icon(Feather.credit_card), title: Text("Profile")),
            BottomNavigationBarItem(
                icon: Icon(Feather.bell), title: Text("Profile")),
            BottomNavigationBarItem(
                icon: Icon(Feather.user), title: Text("Profile")),
          ],
        ),
        body: _pages[currentPage],
      ),
    );
  }
}
