import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import 'build_product_card.dart';

class FreeshipListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FreeshipListPageState();
}

class _FreeshipListPageState extends State<FreeshipListPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 2.5,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 15.0,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Freeship',
          style: TextStyle(
            fontSize: _size.width / 21.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return BuildProductCard();
          },
        ),
      ),
    );
  }
}
