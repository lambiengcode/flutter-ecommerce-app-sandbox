import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: .0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: _size.width / 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.settings,
              color: Colors.grey.shade800,
              size: _size.width / 16.0,
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
