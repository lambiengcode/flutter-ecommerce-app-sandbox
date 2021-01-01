import 'package:flutter/material.dart';
import 'package:now/src/pages/members/widgets/manage_orders_vertical_card.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _pages = [
    Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: .0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ManageOrdersVerticalCard(
            state: '',
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
            state: '',
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
            state: '',
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
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 52.0,
        backgroundColor: Colors.white,
        elevation: 3.5,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey.shade800,
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
              text: 'Ongoing',
            ),
            Tab(
              text: 'History',
            ),
            Tab(
              text: 'Cart',
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 6.0,
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
