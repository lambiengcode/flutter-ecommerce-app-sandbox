import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/models/voucher.dart';
import 'package:now/src/widgets/voucher_verical_card.dart';

class VoucherListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VoucherListPageState();
}

class _VoucherListPageState extends State<VoucherListPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 2.5,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 15.0,
            color: Colors.grey.shade800,
          ),
        ),
        title: Text(
          'Voucher',
          style: TextStyle(
            fontSize: _size.width / 20.5,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            return VoucherVerticalCard(
              title: vouchers[index].title,
              urlToImage: vouchers[index].urlToImage,
            );
          },
        ),
      ),
    );
  }
}
