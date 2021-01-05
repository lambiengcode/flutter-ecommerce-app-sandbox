import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _notifications = true;

  void showSettingsBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return _settings(context);
      },
    );
  }

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
            fontSize: _size.width / 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showSettingsBottomSheet(),
            icon: Icon(
              Feather.align_center,
              color: Colors.grey.shade800,
              size: _size.width / 16.5,
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }

  Widget _settings(context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            4.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Container(
                    height: 48.0,
                    padding: EdgeInsets.fromLTRB(24.0, 2.0, 16.0, 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: 1.85,
                          blurRadius: 1.85,
                          offset:
                              Offset(2.0, 2.5), // changes position of shadow
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: _size.width / 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _notifications = !_notifications;
                    });
                    print(_notifications);
                  },
                  child: Container(
                    height: 48.0,
                    width: 48.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: 1.85,
                          blurRadius: 1.85,
                          offset:
                              Offset(2.0, 2.5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      _notifications
                          ? Icons.notifications_active
                          : Icons.notifications_off,
                      color: _notifications
                          ? Colors.blueAccent
                          : Colors.grey.shade600,
                      size: 22.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
