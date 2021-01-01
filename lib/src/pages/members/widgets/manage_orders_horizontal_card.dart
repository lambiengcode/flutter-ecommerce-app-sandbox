import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class ManageOrdersHorizontalCard extends StatefulWidget {
  final int index;
  final String state;
  ManageOrdersHorizontalCard({this.index, this.state});
  @override
  State<StatefulWidget> createState() => _ManageOrdersHorizontalCardState();
}

class _ManageOrdersHorizontalCardState
    extends State<ManageOrdersHorizontalCard> {
  String urlToImage =
      'https://images.unsplash.com/photo-1462917882517-e150004895fa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjd8fGNvZmZlZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

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
      onTap: () => Get.toNamed('/detailsorder/${widget.state}'),
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
