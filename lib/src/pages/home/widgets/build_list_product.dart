import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:now/src/models/access.dart';

class BuildListProduct extends StatefulWidget {
  final ScrollController scrollKey;
  BuildListProduct({this.scrollKey});
  @override
  State<StatefulWidget> createState() => _BuildListProductState();
}

class _BuildListProductState extends State<BuildListProduct> {
  ScrollController _controller;
  bool start = true;

  _scrollListener() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {}
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {}
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ListView.builder(
      controller: widget.scrollKey,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return Container(
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
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Highland Coffee',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: _size.width / 22.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.amber.shade600,
                              size: _size.width / 22.5,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                '4.6',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: _size.width / 26.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Text(
                            '9.2 km',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: _size.width / 26.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Go To Store',
                            style: TextStyle(
                              fontSize: _size.width / 26.5,
                              color: Colors.blueAccent.shade400,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Icon(
                            Feather.arrow_right,
                            color: Colors.blueAccent.shade400,
                            size: _size.width / 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
