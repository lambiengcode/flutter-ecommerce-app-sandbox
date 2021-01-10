import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class AddPointPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPointPageState();
}

class _AddPointPageState extends State<AddPointPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: Colors.white,
        centerTitle: true,
        brightness: Brightness.dark,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            color: Color(0xFF2C3D50),
            size: _size.width / 15.0,
          ),
        ),
        title: Text(
          'Nạp Điểm',
          style: TextStyle(
            color: Color(0xFF2C3D50),
            fontSize: _size.width / 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12.0),
              Text(
                '2701',
                style: TextStyle(
                  color: Color(0xFFED5C20),
                  fontSize: _size.width / 12.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                'Điểm',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: _size.width / 26.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 28.0),
              _buildMoneyToPoint(context, '100', '100,000'),
              _buildShadow(context),
              _buildMoneyToPoint(context, '500', '500,000'),
              _buildShadow(context),
              _buildMoneyToPoint(context, '1000', '1,000,000'),
              _buildShadow(context),
              _buildMoneyToPoint(context, '3000', '3,000,000'),
              _buildShadow(context),
              _buildMoneyToPoint(context, '5000', '5,000,000'),
              _buildShadow(context),
              Container(
                padding: EdgeInsets.fromLTRB(14.0, 16.0, 12.0, 16.0),
                margin: EdgeInsets.symmetric(horizontal: 26.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.5),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .0,
                      blurRadius: 4.25,
                      offset: Offset(0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Feather.plus,
                      color: Color(0xFFED5C20),
                      size: _size.width / 20.0,
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text(
                        'Nhập số điểm bạn muốn nạp',
                        style: TextStyle(
                          color: Color(0xFFED5C20),
                          fontSize: _size.width / 26.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoneyToPoint(context, title, value) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 12.0, 16.0),
      margin: EdgeInsets.symmetric(horizontal: 26.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.5),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFABBAD5),
            spreadRadius: .0,
            blurRadius: 4.25,
            offset: Offset(0, 2.5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: _size.width / 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' điểm',
                  style: TextStyle(
                    fontSize: _size.width / 28.0,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value + ' đ',
            style: TextStyle(
              color: Color(0xFFA7CA42),
              fontSize: _size.width / 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShadow(context) {
    return Container(
      height: 18.0,
      color: Colors.white.withOpacity(.01),
      margin: EdgeInsets.symmetric(horizontal: 22.5),
    );
  }
}
