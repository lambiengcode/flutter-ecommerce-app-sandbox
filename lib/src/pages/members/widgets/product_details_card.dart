import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class ProductDetailsCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailsCardState();
}

class _ProductDetailsCardState extends State<ProductDetailsCard> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          bottom: 4.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFABBAD5),
              spreadRadius: 1.15,
              blurRadius: 1.25,
              offset: Offset(.0, 2.5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: _size.width * .25,
              width: _size.width * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRcMynRQ0TtZ0YwF6jgzgqqiZ4ukK7s5Qjrg&usqp=CAU'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                height: _size.width * .25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Highlands Coffee',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: _size.width / 22.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Quantity: ',
                                style: TextStyle(
                                  fontSize: _size.width / 26.0,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: '12',
                                style: TextStyle(
                                  fontSize: _size.width / 24.0,
                                  color: Colors.blueAccent.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '239,000đ',
                      style: TextStyle(
                        fontSize: _size.width / 24.0,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
