import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/models/member.dart';
import 'package:now/src/pages/members/widgets/ranking_user_card.dart';

class MyPointsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPointsPageState();
}

class _MyPointsPageState extends State<MyPointsPage> {
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
          'My Points',
          style: TextStyle(
            fontSize: _size.width / 21.0,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            RankingUserCard(
              username: 'lambiengcode',
              urlToImage: members[0].urlToImage,
              index: 7,
              point: '2200',
              isMe: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              child: Divider(
                height: .25,
                thickness: .25,
                color: Colors.grey.shade400,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return RankingUserCard(
                  username: members[index].username,
                  urlToImage: members[index].urlToImage,
                  index: index + 1,
                  point: '2200',
                  isMe: members[index].username == 'lambiengcode',
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
