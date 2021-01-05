import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/models/voucher.dart';
import 'package:now/src/widgets/product_vertical_card.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 15.0,
            color: Colors.grey.shade800,
          ),
        ),
        title: Text(
          'Confirm Order',
          style: TextStyle(
            fontSize: _size.width / 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: _size.height * .3,
                    ),
                    Container(
                      width: _size.width,
                      padding: EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFABBAD5),
                            spreadRadius: .0,
                            blurRadius: 1.25,
                            offset:
                                Offset(.0, 1.8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Highlands Coffee Nguyễn An Ninh',
                            style: TextStyle(
                              fontSize: _size.width / 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ...vouchers.map((item) {
                            return ProductVerticalCard();
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
