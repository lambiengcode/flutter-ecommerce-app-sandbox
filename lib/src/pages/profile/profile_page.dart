import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:now/src/widgets/top_snackbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Me',
          style: TextStyle(
            fontSize: _size.width / 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade700,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.0,
              ),
              GestureDetector(
                onTap: () => Get.toNamed('/myprofile'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: _size.width * .3,
                          width: _size.width * .3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/avt.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'lambiengcode',
                          style: TextStyle(
                            fontSize: _size.width / 22.5,
                            color: Colors.blueGrey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .0,
                      blurRadius: .5,
                      offset: Offset(2.0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildAction(context, 'My Voucher', Feather.tag),
                    _padding(context),
                    _buildAction(context, 'My Points', FontAwesomeIcons.coins),
                    _padding(context),
                    _buildAction(context, 'Payment', Feather.credit_card),
                    _padding(context),
                    _buildAction(context, 'Address', Feather.map_pin),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .0,
                      blurRadius: .5,
                      offset: Offset(2.0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildAction(
                        context, 'For Shop Owner', FontAwesomeIcons.store),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .0,
                      blurRadius: .5,
                      offset: Offset(2.0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildAction(context, 'Term & Policy', Feather.help_circle),
                    _padding(context),
                    _buildAction(context, 'Settings', Feather.settings),
                    _padding(context),
                    _buildAction(context, 'About App', Feather.alert_circle),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                height: 54.0,
                width: _size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
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
                      offset: Offset(2.0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: _size.width / 26.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _padding(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(
        indent: 22.0,
        endIndent: 22.0,
        thickness: .25,
        height: .25,
        color: Colors.blueGrey,
      ),
    );
  }

  Widget _buildAction(context, title, icon) {
    final _size = MediaQuery.of(context).size;
    GetSnackBar getSnackBar = GetSnackBar(
      title: 'Comming Soon!',
      subTitle: 'This feature will available in next update',
      size: _size,
    );
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'My Voucher':
            Get.toNamed('/myvoucher');
            break;
          case 'My Points':
            Get.toNamed('/mypoints');
            break;
          case 'Payment':
            getSnackBar.show();
            break;
          case 'Address':
            Get.toNamed('/myaddress');
            break;
          case 'Term & Policy':
            getSnackBar.show();
            break;
          case 'About App':
            getSnackBar.show();
            break;
          case 'For Shop Owner':
            Get.toNamed('/owner');
            break;
          default:
            break;
        }
      },
      child: Container(
        width: _size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: _size.width / 18.0,
                  color: Colors.blueGrey.shade700,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: _size.width / 24.0,
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Icon(
              Feather.arrow_right,
              size: _size.width / 16.0,
              color: Colors.blueGrey.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
