import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:now/src/pages/home/home_page.dart';
import 'package:now/src/pages/notifications/notifications_page.dart';
import 'package:now/src/pages/orders/orders_page.dart';
import 'package:now/src/pages/profile/profile_page.dart';
import 'package:now/src/pages/save/save_page.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPage = 0;
  var _pages = [
    HomePage(),
    OrdersPage(),
    SavePage(),
    NotificationsPage(),
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
          elevation: 2.5,
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
          selectedItemColor: Colors.blueAccent.shade400,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Feather.home), title: Text("Dashboard")),
            BottomNavigationBarItem(
                icon: Icon(Feather.clipboard), title: Text("Feed")),
            BottomNavigationBarItem(
                icon: Icon(Feather.heart), title: Text("Profile")),
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
