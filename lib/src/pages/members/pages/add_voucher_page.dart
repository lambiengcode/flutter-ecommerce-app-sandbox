import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddVoucherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVoucherPageState();
}

class _AddVoucherPageState extends State<AddVoucherPage> {
  File _image;
  String _title;
  bool _percent;

  @override
  void initState() {
    super.initState();
    _percent = true;
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
                  _image == null
                      ? Container(
                          color: Colors.grey.shade300,
                          padding: EdgeInsets.only(
                            top: _size.height / 22.0,
                          ),
                          height: _size.height * .35,
                          width: _size.width,
                          child: Icon(
                            Feather.image,
                            color: Colors.grey.shade800,
                            size: _size.width / 6.0,
                          ),
                        )
                      : Container(),
                  Container(
                    padding: EdgeInsets.only(
                      top: _size.height / 22.0,
                    ),
                    height: _size.height * .35,
                    width: _size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Feather.arrow_left,
                            color: _image == null
                                ? Colors.grey.shade800
                                : Colors.white,
                            size: _size.width / 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[200]))),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: _size.width / 24,
                    fontWeight: FontWeight.w400,
                  ),
                  validator: (val) =>
                      val.length == 0 ? 'Enter your Email' : null,
                  onChanged: (val) => _title = val.trim(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 2.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2.5,
                      ),
                    ),
                    hintText: "Title",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: _size.width / 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: _size.width / 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _percent = !_percent;
                        });
                      },
                      child: Text(
                        _percent ? 'Percent - %' : 'Value - VNĐ',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: _size.width / 28.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                height: 52.0,
                margin: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                padding: EdgeInsets.fromLTRB(24.0, 2.0, 16.0, 0.0),
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
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (newValue.text.isEmpty) {
                        return newValue.copyWith(text: '');
                      } else if (newValue.text.compareTo(oldValue.text) != 0) {
                        final int selectionIndexFromTheRight =
                            newValue.text.length - newValue.selection.end;
                        final f = NumberFormat("#,###");
                        final number = int.parse(
                            newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
                        final newString = f.format(number);
                        return TextEditingValue(
                          text: newString,
                          selection: TextSelection.collapsed(
                              offset: newString.length -
                                  selectionIndexFromTheRight),
                        );
                      } else {
                        return newValue;
                      }
                    })
                  ],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: _size.width / 26,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.end,
                  validator: (val) =>
                      val.length == 0 ? 'Enter your Email' : null,
                  decoration: InputDecoration(
                    suffixText: _percent ? '%' : ' đ',
                    suffixStyle: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    hintText: "0",
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
}
