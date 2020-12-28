import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:now/src/models/access.dart';
import 'package:now/src/pages/home/widgets/build_list_product.dart';
import 'package:now/src/pages/home/widgets/build_product_card.dart';
import 'package:now/src/pages/home/widgets/carousel_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController scrollController = new ScrollController();
  final dataKey = new GlobalKey();

  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );
    _pages = [
      BuildListProduct(
        scrollKey: scrollController,
      ),
      BuildListProduct(
        scrollKey: scrollController,
      ),
      BuildListProduct(
        scrollKey: scrollController,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey.shade200,
              child: CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage('images/avt.jpg'),
              ),
            ),
            SizedBox(
              width: 6.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hi, ',
                    style: TextStyle(
                      fontSize: _size.width / 16.0,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lobster',
                    ),
                  ),
                  TextSpan(
                    text: 'lambiengcode',
                    style: TextStyle(
                      fontSize: _size.width / 18.8,
                      color: Colors.blueAccent.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.gift,
              size: _size.width / 15.0,
              color: Colors.red.shade400,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Feather.map_pin,
                      color: Colors.green.shade600,
                      size: _size.width / 16.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '1 Vo Van Ngan, Linh Chieu, Thu Duc, HCM',
                      style: TextStyle(
                        fontSize: _size.width / 25.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 14.0,
                  ),
                  height: 42.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFABBAD5),
                        spreadRadius: .5,
                        blurRadius: 1.25,
                        offset: Offset(0, 1.5), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Feather.search,
                        size: _size.width / 22.0,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: _size.width / 25.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                height: _size.height * .15,
                margin: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: CarouselImage(),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: _size.height * .21,
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: actions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                6.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFABBAD5),
                                  spreadRadius: .4,
                                  blurRadius: 1.0,
                                  offset: Offset(
                                      0, 1.0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(
                              actions[index].icon,
                              size: _size.width / 20.0,
                              color: actions[index].color,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          actions[index].title,
                          style: TextStyle(
                            fontSize: _size.width / 30.0,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 10.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .0,
                      blurRadius: .5,
                      offset: Offset(2.0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: _size.height * .3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .0,
                      blurRadius: .5,
                      offset: Offset(2.0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Voucher',
                            style: TextStyle(
                              fontSize: _size.width / 22.5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'See More',
                                style: TextStyle(
                                  fontSize: _size.width / 26.5,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Feather.arrow_right,
                                color: Colors.blueAccent,
                                size: _size.width / 20.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 12.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: index != 0 ? 10.0 : 6.0,
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
                                    image: AssetImage('images/logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                actions[index].title,
                                style: TextStyle(
                                  fontSize: _size.width / 24.0,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: _size.height * .295,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: .0,
                      blurRadius: .5,
                      offset: Offset(2.0, 2.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Free Ship',
                            style: TextStyle(
                              fontSize: _size.width / 22.5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'See More',
                                style: TextStyle(
                                  fontSize: _size.width / 26.5,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Feather.arrow_right,
                                color: Colors.blueAccent,
                                size: _size.width / 20.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 12.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: index != 0 ? 10.0 : 6.0,
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
                                    image: AssetImage('images/logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                actions[index].title,
                                style: TextStyle(
                                  fontSize: _size.width / 24.0,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: _size.height * .235,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABBAD5),
                      spreadRadius: 1.15,
                      blurRadius: 1.25,
                      offset: Offset(2.0, 4.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 4.0),
                      height: _size.width * .3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: actions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(left: index == 0 ? 8.0 : 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: _size.width * .2,
                                  width: _size.width * .2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFABBAD5),
                                        spreadRadius: 1.15,
                                        blurRadius: 1.25,
                                        offset: Offset(.0,
                                            3.5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    actions[index].icon,
                                    size: _size.width / 16.0,
                                    color: actions[index].color,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  actions[index].title,
                                  style: TextStyle(
                                    fontSize: _size.width / 28.0,
                                    color: index == 0
                                        ? Colors.blueAccent
                                        : Colors.grey.shade800,
                                    fontWeight: index == 0
                                        ? FontWeight.bold
                                        : FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Divider(
                      height: .25,
                      thickness: .25,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        key: dataKey,
                        elevation: .0,
                        child: TabBar(
                          onTap: (index) =>
                              Scrollable.ensureVisible(dataKey.currentContext),
                          controller: _tabController,
                          labelColor: Colors.blueAccent,
                          indicatorColor: Colors.blueAccent,
                          unselectedLabelColor: Colors.grey.shade700,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 2.5,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: _size.width / 26.0,
                            fontFamily: 'Raleway-Bold',
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: _size.width / 28.0,
                            fontFamily: 'Raleway-Bold',
                          ),
                          tabs: [
                            Tab(
                              text: 'Near Me',
                            ),
                            Tab(
                              text: 'Top Seller',
                            ),
                            Tab(
                              text: 'Rating',
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              ...actions.map((item) {
                return BuildProductCard();
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
