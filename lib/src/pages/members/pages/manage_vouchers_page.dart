import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/models/voucher.dart';
import 'package:now/src/pages/members/widgets/manage_voucher_vertical_card.dart';

class ManageVouchersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ManageVouchersPageState();
}

class _ManageVouchersPageState extends State<ManageVouchersPage> {
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
          'Vouchers',
          style: TextStyle(
            fontSize: _size.width / 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/addvoucher'),
            icon: Icon(
              Feather.plus,
              size: _size.width / 14.0,
              color: Colors.blueAccent.shade400,
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            return ManageVoucherVerticalCard(
              title: vouchers[index].title,
              urlToImage: vouchers[index].urlToImage,
            );
          },
        ),
      ),
    );
  }
}
