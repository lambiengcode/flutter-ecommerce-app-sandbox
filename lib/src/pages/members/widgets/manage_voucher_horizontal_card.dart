import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class ManageVoucherHorizontalCard extends StatefulWidget {
  final String title;
  final String urlToImage;
  ManageVoucherHorizontalCard({this.title, this.urlToImage});
  @override
  State<StatefulWidget> createState() => _ManageVoucherHorizontalCardState();
}

class _ManageVoucherHorizontalCardState
    extends State<ManageVoucherHorizontalCard> {
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
          left: 6.0,
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
                  image: NetworkImage(widget.urlToImage),
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
                widget.title,
                style: TextStyle(
                  fontSize: _size.width / 24.0,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
