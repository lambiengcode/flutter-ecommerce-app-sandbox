import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/profile/widgets/my_voucher_card.dart';
import '../../../models/voucher.dart';

class MyVoucherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyVoucherPageState();
}

class _MyVoucherPageState extends State<MyVoucherPage> {
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
            color: Colors.grey.shade800,
          ),
        ),
        title: Text(
          'My Voucher',
          style: TextStyle(
            fontSize: _size.width / 21.0,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            return MyVoucherCard(
              title: vouchers[index].title,
              urlToImage: vouchers[index].urlToImage,
            ); // Voucher Card Vertical
          },
        ),
      ),
    );
  }
}
