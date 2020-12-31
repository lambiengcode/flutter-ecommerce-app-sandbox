import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class ManageVoucherVerticalCard extends StatefulWidget {
  final String title;
  final String urlToImage;
  ManageVoucherVerticalCard({this.title, this.urlToImage});
  @override
  State<StatefulWidget> createState() => _ManageVoucherVerticalCardState();
}

class _ManageVoucherVerticalCardState extends State<ManageVoucherVerticalCard> {
  void showDeleteBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomDelete();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.toNamed('editvoucher/${widget.title}/50/true',
          arguments: widget.urlToImage),
      onLongPress: () => showDeleteBottomSheet(),
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
                  image: NetworkImage(widget.urlToImage),
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
                          widget.title,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: _size.width / 22.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          '20 Voucher Left',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: _size.width / 28.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => showDeleteBottomSheet(),
                      child: Text(
                        'DELETE',
                        style: TextStyle(
                          fontSize: _size.width / 25.0,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                        ),
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
