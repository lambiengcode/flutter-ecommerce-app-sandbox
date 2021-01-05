import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/home/widgets/build_store_card.dart';
import 'package:now/src/widgets/product_vertical_card.dart';

class SearchProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            color: Colors.grey.shade800,
            size: _size.width / 16.0,
          ),
          onPressed: () => Get.back(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFABBAD5),
                        spreadRadius: .5,
                        blurRadius: 1.25,
                        offset: Offset(0, 1.5), // changes position of shadow
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: _size.width / 26.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Feather.search,
                        color: Colors.grey.shade600,
                        size: _size.width / 24.0,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: _size.width / 26.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Feather.sliders,
              color: Colors.grey.shade800,
              size: _size.width / 16.0,
            ),
            onPressed: () => null,
          ),
          SizedBox(
            width: 4.0,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductVerticalCard();
          },
        ),
      ),
    );
  }
}
