import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class BottomBuy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomBuyState();
}

class _BottomBuyState extends State<BottomBuy> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            8.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Feather.arrow_left,
                    size: _size.width / 15.0,
                    color: Colors.black,
                  ),
                ),
                Container(),
                Text(
                  'Add New Item',
                  style: TextStyle(
                    fontSize: _size.width / 23.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Container(),
                Container(),
                Container(),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Divider(
              height: .5,
              thickness: .5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: _size.width * .2,
                    width: _size.width * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage('images/avt.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    height: _size.width * .2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Coffee Sofresh',
                              style: TextStyle(
                                fontSize: _size.width / 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              '40 sold | 4 likes',
                              style: TextStyle(
                                fontSize: _size.width / 28.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '39,000đ',
                          style: TextStyle(
                            fontSize: _size.width / 26.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              child: Text(
                "Quantity",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: _size.width / 24.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: .25,
              height: .25,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (count != 0) {
                        count--;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      14.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: .8,
                          blurRadius: 2.0,
                          offset: Offset(0, 2.0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Feather.minus,
                      color: Colors.grey.shade600,
                      size: _size.width / 18.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 16.0, right: 12.0, top: 15.0, bottom: 15.0),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: .8,
                          blurRadius: 2.0,
                          offset: Offset(0, 2.0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: _size.width / 24.0,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      14.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: .8,
                          blurRadius: 2.0,
                          offset: Offset(0, 2.0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Feather.plus,
                      color: Colors.blueAccent,
                      size: _size.width / 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              child: Text(
                "Size",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: _size.width / 24.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: .25,
              height: .25,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 4.0,
            ),
            _buildActionsButton(
                context, 'Ban User', Feather.slash, Colors.redAccent),
            _buildActionsButton(
                context, 'Kick User', Feather.user_x, Colors.redAccent),
            SizedBox(
              height: 12.0,
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: .25,
              height: .25,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Total: 39,000đ',
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
                          'Add to Cart',
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
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsButton(context, title, icon, color) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {},
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 5.0,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFABBAD5),
              spreadRadius: .8,
              blurRadius: 2.0,
              offset: Offset(0, 2.0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 16.0,
            ),
            Icon(
              icon,
              color: color,
              size: _size.width / 18.0,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: _size.width / 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
