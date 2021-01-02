import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class ManageProductHorizontalCard extends StatefulWidget {
  final int index;
  ManageProductHorizontalCard({this.index});
  @override
  State<StatefulWidget> createState() => _ManageProductHorizontalCardState();
}

class _ManageProductHorizontalCardState
    extends State<ManageProductHorizontalCard> {
  String urlToImage =
      'https://images.unsplash.com/photo-1546379753-abb7fd8cfb93?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjk5fHxjb2ZmZWV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

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
      onTap: () => Get.toNamed('/editproduct/Coffee Sofresh/39000/49000/59000',
          arguments:
              'https://www.highlandscoffee.com.vn/vnt_upload/weblink/HCO-7548-PHIN-SUA-DA-2019-TALENT-WEB_1.jpg'),
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
                'CARAMEL FREEZE',
                style: TextStyle(
                  fontSize: _size.width / 26.0,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Container(
              width: _size.width * .4,
              child: Text(
                '39,000đ',
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
