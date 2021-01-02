import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/store/widgets/carousel_banner.dart';
import 'package:now/src/widgets/product_horizontal_card.dart';
import 'package:now/src/widgets/product_vertical_card.dart';

import '../../models/access.dart';

class StorePage extends StatefulWidget {
  final String id;
  StorePage({this.id});
  @override
  State<StatefulWidget> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  ScrollController _scrollController = new ScrollController();
  bool _showAppBar = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: .0,
        backgroundColor: _showAppBar ? Colors.transparent : Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            color: _showAppBar ? Colors.white : Colors.black,
            size: _size.width / 15.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Feather.search,
              color: _showAppBar ? Colors.white : Colors.black,
              size: _size.width / 15.0,
            ),
          ),
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Feather.heart,
              color: _showAppBar ? Colors.white : Colors.black,
              size: _size.width / 15.0,
            ),
          ),
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Feather.shopping_cart,
              color: _showAppBar ? Colors.white : Colors.black,
              size: _size.width / 15.0,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
        ],
      ),
      body: Container(
        child: NotificationListener(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: _size.height / 25.0,
                  ),
                  height: _size.height * .25,
                  width: _size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.highlandscoffee.com.vn/vnt_upload/weblink/PDHT-DEC-WEB-FINAL.jpg'),
                      fit: BoxFit.cover,
                    ),
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
                      fontSize: _size.width / 20.5,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 14.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Open: ',
                          style: TextStyle(
                            fontSize: _size.width / 24.0,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '6:00 - 22:00',
                          style: TextStyle(
                            fontSize: _size.width / 26.0,
                            color: Colors.blueAccent.shade700,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Divider(
                  thickness: .4,
                  height: .4,
                  color: Colors.grey.shade400,
                  indent: 12.0,
                  endIndent: 12.0,
                ),
                SizedBox(
                  height: 8.0,
                ),
                _buildHorizontalGroup(context, 'Popular Items'),
                SizedBox(
                  height: 20.0,
                ),
                _buildHorizontalGroup(context, 'On Sale'),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: _size.height * .15,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: CarouselBanner(),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Product',
                        style: TextStyle(
                          fontSize: _size.width / 22.5,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/productlist/All Product'),
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
                              size: _size.width / 20.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                ...actions.map((item) {
                  return ProductVerticalCard();
                }).toList(),
              ],
            ),
          ),
          onNotification: (t) {
            if (_scrollController.position.pixels > _size.height * .225) {
              setState(() {
                _showAppBar = false;
              });
            } else {
              setState(() {
                _showAppBar = true;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildHorizontalGroup(context, title) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.width * .675,
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
                  onTap: () => Get.toNamed('/productlist/$title'),
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
                        size: _size.width / 20.5,
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
              return ProductHorizontalCard(
                index: index,
              );
            },
          )),
        ],
      ),
    );
  }
}
