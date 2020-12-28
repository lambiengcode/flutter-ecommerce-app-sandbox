import 'package:flutter/material.dart';
import 'package:now/src/models/access.dart';

class BuildListProduct extends StatefulWidget {
  final ScrollController scrollKey;
  BuildListProduct({this.scrollKey});
  @override
  State<StatefulWidget> createState() => _BuildListProductState();
}

class _BuildListProductState extends State<BuildListProduct> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ListView.builder(
      controller: widget.scrollKey,
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
                child: Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}
