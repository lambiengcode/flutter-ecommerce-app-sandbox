import 'package:flutter/material.dart';

import '../models/voucher.dart';

class VoucherCard extends StatefulWidget {
  final int index;
  VoucherCard({this.index});
  @override
  State<StatefulWidget> createState() => _VoucherCardState();
}

class _VoucherCardState extends State<VoucherCard> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: widget.index != 0 ? 10.0 : 6.0,
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
                image: NetworkImage(vouchers[widget.index].urlToImage),
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
              vouchers[widget.index].title,
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
  }
}
