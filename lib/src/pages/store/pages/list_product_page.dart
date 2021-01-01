import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/widgets/product_vertical_card.dart';

class ListProductPage extends StatefulWidget {
  final String title;
  ListProductPage({this.title});
  @override
  State<StatefulWidget> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
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
            size: _size.width / 15.0,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: _size.width / 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
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
