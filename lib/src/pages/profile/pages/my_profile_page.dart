import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  File _image;

  void showImageBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return _chooseImage(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 16.0,
            color: Colors.grey.shade800,
          ),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: _size.width / 21.0,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: _size.width * .32),
              child: Divider(
                color: Colors.grey.shade400,
                thickness: .4,
                height: .4,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/avt.jpg'),
                          radius: 26.0,
                        ),
                        GestureDetector(
                          onTap: () => showImageBottomSheet(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Change Avatar',
                                style: TextStyle(
                                  fontSize: _size.width / 28.0,
                                  color: Colors.blueAccent.shade400,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blueAccent.shade400,
                                size: _size.width / 24.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildDivider(context),
                  _buildActionLine(context, 'Username', 'lambiengcode'),
                  _buildDivider(context),
                  _buildActionLine(context, 'Phone Number', '*******877'),
                ],
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildActionLine(context, 'Name', 'Hồng Vinh'),
                  _buildDivider(context),
                  _buildActionLine(context, 'Email', 'lambiengcode@gmail.com'),
                  _buildDivider(context),
                  _buildActionLine(context, 'Gender', 'None'),
                  _buildDivider(context),
                  _buildActionLine(context, 'Date of Birth', '02/12/2000'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionLine(context, title, value) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Date of Birth':
            DatePicker.showDatePicker(
              context,
              showTitleActions: true,
              minTime: DateTime(1940, 12, 2),
              maxTime: DateTime(2010, 12, 2),
              theme: DatePickerTheme(
                  itemHeight: 36.0,
                  titleHeight: 52.0,
                  headerColor: Colors.grey.shade50,
                  backgroundColor: Colors.white,
                  itemStyle: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.8,
                  ),
                  cancelStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16.8,
                  ),
                  doneStyle: TextStyle(
                    color: Colors.blueAccent.shade400,
                    fontSize: 16.8,
                  )),
              onChanged: (date) {
                print('change $date in time zone ' +
                    date.timeZoneOffset.inHours.toString());
              },
              onConfirm: (date) {
                print('confirm $date');
              },
              currentTime: DateTime(2000, 6, 12),
              locale: LocaleType.vi,
            );
            break;
          default:
            break;
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: _size.width / 26.8,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: _size.width / 27.5,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                title == 'Username' ||
                        title == 'Phone Number' ||
                        title == 'Email'
                    ? Container()
                    : Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.shade700,
                        size: _size.width / 24.0,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Divider(
        height: .25,
        thickness: .25,
        color: Colors.grey.shade300,
        indent: 8.0,
        endIndent: 8.0,
      ),
    );
  }

  Widget _chooseImage(context) {
    final _size = MediaQuery.of(context).size;

    Future<void> _pickImage(ImageSource source) async {
      File selected = await ImagePicker.pickImage(source: source);
      setState(() {
        _image = selected;
      });
      Get.back();
    }

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
              height: 14.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => _pickImage(ImageSource.gallery),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.5,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFABBAD5),
                              spreadRadius: .8,
                              blurRadius: 2.0,
                              offset:
                                  Offset(0, 2.0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Feather.image,
                          color: Colors.grey.shade800,
                          size: _size.width / 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () => _pickImage(ImageSource.camera),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.5,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: .8,
                              blurRadius: 2.0,
                              offset:
                                  Offset(0, 2.0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          Feather.camera,
                          color: Colors.white,
                          size: _size.width / 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
