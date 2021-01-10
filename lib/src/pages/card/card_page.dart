import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: .0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '\tXin chào, ',
                style: TextStyle(
                  fontSize: _size.width / 18.0,
                  color: Color(0xFF2C3D50),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'DAO HONG VINH',
                style: TextStyle(
                  fontSize: _size.width / 16.0,
                  color: Color(0xFF2C3D50),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: _size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.0),
              _buildMyCard(context),
              SizedBox(height: 14.0),
              _buildMyInfo(context),
              SizedBox(height: 12.0),
              _buildMyAddPoints(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyCard(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * .26,
      width: _size.width,
      margin: EdgeInsets.symmetric(horizontal: 18.0),
      padding: EdgeInsets.fromLTRB(24.0, 2.5, 12.0, 12.0),
      decoration: BoxDecoration(
        color: Color(0xFFD3AE56),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD3AE58),
            spreadRadius: 2.0,
            blurRadius: .5,
            offset: Offset(0, .2), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 14.0,
              ),
              Text(
                'APEC BIOTECHNOLOGY',
                style: TextStyle(
                  color: Color(0xFFC0C9C9),
                  fontWeight: FontWeight.w400,
                  fontSize: _size.width / 16.0,
                  fontFamily: 'Lobster',
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'G O L D',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.values[2],
                  fontSize: _size.width / 16.0,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                '9100298421',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w700,
                  fontSize: _size.width / 18.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: _size.width / 42.0,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                'DAO HONG VINH',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: _size.width / 26.0,
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MEMBER SINCE',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: _size.width / 42.0,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '01/21',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: _size.width / 26.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VALID THROUGH',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: _size.width / 42.0,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '12/21',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: _size.width / 26.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 4.0,
            right: 4.0,
            child: Container(
              height: _size.width * .25,
              width: _size.width * .25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyInfo(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * .18,
      width: _size.width,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.fromLTRB(.0, 4.0, .0, 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Color(0xFFD7C29F), width: 1.2),
      ),
      child: Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(left: 20.0, right: 8.0, top: 4.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông Tin Tài Khoản',
                  style: TextStyle(
                    color: Color(0xFF2C3D50),
                    fontSize: _size.width / 23.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    Icons.more_horiz,
                    color: Color(0xFFD7C29F),
                    size: _size.width / 12.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: .25,
            height: .25,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      _buildActionMyInfo(
                        context,
                        'Thông tin thẻ',
                        Icons.credit_card,
                      ),
                      _verticalDivider(context),
                      _buildActionMyInfo(
                        context,
                        'Thông tin cá nhân',
                        Icons.credit_card,
                      ),
                      _verticalDivider(context),
                      _buildActionMyInfo(
                        context,
                        'Chi tiết hoạt động',
                        Icons.credit_card,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider(context) {
    return VerticalDivider(
      color: Colors.grey.shade400,
      width: .25,
      thickness: .25,
    );
  }

  Widget _buildActionMyInfo(context, title, icon) {
    final _size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFFD7C29F),
            size: _size.width / 15.0,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF2C3D50),
              fontSize: _size.width / 32.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyAddPoints(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Color(0xFFD7C29F), width: 1.2),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Điểm của tôi: 2701',
                  style: TextStyle(
                    color: Color(0xFF2C3D50),
                    fontSize: _size.width / 25.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed('/addpoint'),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFD7C29F),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Nạp Điểm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _size.width / 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
