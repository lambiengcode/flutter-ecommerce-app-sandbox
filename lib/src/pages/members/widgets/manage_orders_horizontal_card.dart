import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class ManageOrdersHorizontalCard extends StatefulWidget {
  final int index;
  ManageOrdersHorizontalCard({this.index});
  @override
  State<StatefulWidget> createState() => _ManageOrdersHorizontalCardState();
}

class _ManageOrdersHorizontalCardState
    extends State<ManageOrdersHorizontalCard> {
  String urlToImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRcMynRQ0TtZ0YwF6jgzgqqiZ4ukK7s5Qjrg&usqp=CAU';

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
      onTap: () => Get.toNamed('/detailsorder'),
      onLongPress: () => showDeleteBottomSheet(),
      child: Container(
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
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(urlToImage),
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
                'Hồng Vinh | 7 Items',
                style: TextStyle(
                  fontSize: _size.width / 24.0,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Container(
              width: _size.width * .4,
              child: Text(
                '139,000đ',
                style: TextStyle(
                  fontSize: _size.width / 26.0,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
