import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/product_details_card.dart';

class DetailsOrderPage extends StatefulWidget {
  final String state;
  DetailsOrderPage({this.state});
  @override
  State<StatefulWidget> createState() => _DetailsOrderPageState();
}

class _DetailsOrderPageState extends State<DetailsOrderPage> {
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
          'Details',
          style: TextStyle(
            fontSize: _size.width / 21.0,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          widget.state == 'Pending'
              ? GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 6.0,
                      top: 22.0,
                    ),
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: _size.width / 26.0,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            width: 2.0,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductDetailsCard();
                },
              ),
            ),
            Container(
              height: 60.0,
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 8.0, .0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Total: 2,390,000đ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: _size.width / 26.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: .8,
                              blurRadius: 2.0,
                              offset:
                                  Offset(0, 2.0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _size.width / 26.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
