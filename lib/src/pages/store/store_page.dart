import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class StorePage extends StatefulWidget {
  final String id;
  StorePage({this.id});
  @override
  State<StatefulWidget> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: _size.height / 22.0,
                ),
                height: _size.height * .25,
                width: _size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/avt.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Feather.arrow_left,
                        color: Colors.white,
                        size: _size.width / 15.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Feather.search,
                            color: Colors.white,
                            size: _size.width / 15.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Feather.heart,
                            color: Colors.white,
                            size: _size.width / 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Text(
                  widget.id,
                  style: TextStyle(
                    fontSize: _size.width / 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.amber.shade600,
                          size: _size.width / 22.5,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            '4.6',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: _size.width / 26.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4.0,
                      ),
                      child: Text(
                        '9.2 km',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: _size.width / 26.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _buildHorizontalGroup(context, 'Popular Items'),
              SizedBox(
                height: 20.0,
              ),
              _buildHorizontalGroup(context, 'On Sale'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalGroup(context, title) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.width * .67,
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
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: _size.width / 22.5,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed('/freeship'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'See More',
                        style: TextStyle(
                          fontSize: _size.width / 26.5,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Icon(
                        Feather.arrow_right,
                        color: Colors.blueAccent,
                        size: _size.width / 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 12.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: index != 0 ? 10.0 : 6.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: _size.width * .4,
                      width: _size.width * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          2.0,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRcMynRQ0TtZ0YwF6jgzgqqiZ4ukK7s5Qjrg&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Container(
                      width: _size.width * .4,
                      child: Text(
                        'Free Ship Highland Coffee',
                        style: TextStyle(
                          fontSize: _size.width / 24.0,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }

  Widget _buildVerticalGroup(context) {
    return Container(
      height: 200.0,
    );
  }
}
