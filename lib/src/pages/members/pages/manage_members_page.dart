import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/models/member.dart';
import 'package:now/src/pages/members/widgets/manage_member_vertical_card.dart';

class ManageMembersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ManageMembersPageState();
}

class _ManageMembersPageState extends State<ManageMembersPage> {
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
          'Members',
          style: TextStyle(
            fontSize: _size.width / 20.5,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: members.length,
          itemBuilder: (context, index) {
            return ManageMemberVerticalCard(
              urlToImage: members[index].urlToImage,
              username: members[index].username,
              online: index % 2 == 0,
            );
          },
        ),
      ),
    );
  }
}
