import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class EditStorePage extends StatefulWidget {
  final String title;
  final String urlToImage;
  EditStorePage({this.title, this.urlToImage});
  @override
  State<StatefulWidget> createState() => _EditStorePageState();
}

class _EditStorePageState extends State<EditStorePage> {
  File _image;
  String _title = '';
  String _open = '6:00 AM';
  String _close = '10:00 PM';

  TextEditingController _titleController = new TextEditingController();

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

  moneyToString(String money) {
    String result = '';
    int count = 0;
    for (int i = money.length - 1; i >= 0; i--) {
      if (count == 3) {
        count = 1;
        result += ',';
      } else {
        count++;
      }
      result += money[i];
    }
    String need = '';
    for (int i = result.length - 1; i >= 0; i--) {
      need += result[i];
    }
    return need;
  }

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _titleController.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => showImageBottomSheet(),
                    child: _image == null
                        ? Container(
                            padding: EdgeInsets.only(
                              top: _size.height / 22.0,
                            ),
                            height: _size.height * .25,
                            width: _size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.urlToImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(
                              top: _size.height / 22.0,
                            ),
                            height: _size.height * .25,
                            width: _size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(_image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: _size.height / 22.0,
                    ),
                    height: _size.height * .25,
                    width: _size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Feather.arrow_left,
                            color: Colors.white.withOpacity(.85),
                            size: _size.width / 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                height: 52.0,
                margin: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                padding: EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    6.0,
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
                child: TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: _size.width / 26,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                  validator: (val) => val.length == 0 ? 'Enter Title' : null,
                  onChanged: (val) => _title = val.trim(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: _size.width / 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Divider(
                height: .25,
                thickness: .25,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 16.0,
              ),
              _buildTime(context, 'Open'),
              SizedBox(
                height: 12.0,
              ),
              _buildTime(context, 'Close'),
              SizedBox(
                height: 24.0,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 24.0,
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
                        offset: Offset(0, 2.0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _size.width / 26.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTime(context, title) {
    void selectedTimeOpen() async {
      TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        },
      );

      setState(() {
        if (title == 'Open') {
          _open = picked.format(context);
        } else {
          _close = picked.format(context);
        }
      });
    }

    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 52.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFABBAD5),
                    spreadRadius: .8,
                    blurRadius: 2.0,
                    offset: Offset(0, 2.0), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: _size.width / 26.0,
                  fontWeight: FontWeight.w600,
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
              onTap: () => selectedTimeOpen(),
              child: Container(
                height: 52.0,
                padding: EdgeInsets.only(right: 12.0),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .8,
                      blurRadius: 2.0,
                      offset: Offset(0, 2.0), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  title == 'Open' ? _open : _close,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: _size.width / 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
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
