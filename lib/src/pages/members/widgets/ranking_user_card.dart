import 'package:flutter/material.dart';
import 'package:now/src/pages/members/widgets/bottom_info.dart';

class RankingUserCard extends StatefulWidget {
  final int index;
  final String urlToImage;
  final String username;
  final String point;
  final bool isMe;
  RankingUserCard(
      {this.urlToImage, this.username, this.point, this.index, this.isMe});
  @override
  State<StatefulWidget> createState() => _RankingUserCardState();
}

class _RankingUserCardState extends State<RankingUserCard> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 12.0,
            ),
            Text(
              widget.index.toString(),
              style: TextStyle(
                color: widget.isMe
                    ? Colors.blueAccent.shade400
                    : widget.index < 4
                        ? Colors.yellow.shade700
                        : Colors.grey.shade800,
                fontSize: _size.width / 22.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Container(
              height: _size.width * .175,
              width: _size.width * .175,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.urlToImage),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(
                right: 4.0,
                bottom: 2.0,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Container(
                height: _size.width * .175,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      widget.username,
                      style: TextStyle(
                        color: widget.isMe
                            ? Colors.blueAccent.shade400
                            : Colors.grey.shade800,
                        fontSize: _size.width / 22.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'SILVER MEMBER',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: _size.width / 28.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Points: ',
                            style: TextStyle(
                              fontSize: _size.width / 26.0,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: widget.point,
                            style: TextStyle(
                              fontSize: _size.width / 26.0,
                              color: Colors.blueAccent.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
