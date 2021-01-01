import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/pages/members/widgets/manage_orders_vertical_card.dart';

class ManageOrdersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ManageOrdersPageState();
}

class _ManageOrdersPageState extends State<ManageOrdersPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _pages = [
    Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: .0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ManageOrdersVerticalCard(
            state: 'Pending',
          );
        },
      ),
    ),
    Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: .0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ManageOrdersVerticalCard(
            state: 'Ongoing',
          );
        },
      ),
    ),
    Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: .0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ManageOrdersVerticalCard(
            state: 'History',
          );
        },
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: _pages.length,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Feather.check_circle,
          color: Colors.white,
          size: _size.width / 18.0,
        ),
        onPressed: () => Get.back(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: _size.height / 18.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFABBAD5),
                    spreadRadius: .0,
                    blurRadius: .5,
                    offset: Offset(.0, 2.5), // changes position of shadow
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.blueAccent,
                indicatorColor: Colors.blueAccent,
                unselectedLabelColor: Colors.grey.shade900,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.5,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _size.width / 23.5,
                  fontFamily: 'Raleway-Bold',
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _size.width / 25.0,
                  fontFamily: 'Raleway-Bold',
                ),
                tabs: [
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Ongoing',
                  ),
                  Tab(
                    text: 'History',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _pages.map((Widget tab) {
                  return tab;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
