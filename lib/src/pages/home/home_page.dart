import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/models/access.dart';
import 'package:now/src/models/voucher.dart';
import 'package:now/src/pages/home/widgets/build_product_card.dart';
import 'package:now/src/pages/home/widgets/carousel_widget.dart';
import 'package:now/src/widgets/voucher_horizontal_card.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/services.dart';

import '../../models/access.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController scrollController = new ScrollController();
  final dataKey = new GlobalKey();
  LocationData currentLocation;
  Future<dynamic> _myLocation;

  String currentType = 'Burger';
  bool showBottomAppBar = false;

  getUserLocation() async {
    //call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    currentLocation = myLocation;
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    String result = '${first.addressLine}';
    print(
        ' ${first.locality},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    result = result.replaceAll(first.adminArea, '');
    result = result.replaceAll(first.countryName, '');
    return result;
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );
    _myLocation = getUserLocation();
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
        bottom: showBottomAppBar ? _buildHomeTab(context) : null,
      ),
      body: Container(
        color: Colors.white,
        child: NotificationListener(
          onNotification: (t) {
            if (scrollController.position.pixels >
                (_size.width * 1.578 + _size.height * .15 + 128.0)) {
              setState(() {
                showBottomAppBar = true;
              });
            } else {
              setState(() {
                showBottomAppBar = false;
              });
            }
          },
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
                      Expanded(
                        child: FutureBuilder(
                          future: _myLocation,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Text(
                                  'Thành Phố Hồ Chí Minh, Việt Nam',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: _size.width / 26.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              default:
                                if (snapshot.hasError) {
                                  return Text(
                                    'Thành Phố Hồ Chí Minh, Việt Nam',
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: _size.width / 26.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  );
                                }

                                return Text(
                                  snapshot.data.toString().substring(0,
                                          snapshot.data.toString().length - 2) +
                                      '...',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: _size.width / 26.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                            }
                          },
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
                      horizontal: 16.0,
                    ),
                    height: 46.0,
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
                  height: _size.width * .418,
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                    ),
                    itemCount: actions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            Get.toNamed('/categories/${actions[index].title}'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 52.0,
                              width: 52.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  4.0,
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
                                size: _size.width / 22.0,
                                color: actions[index].color,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              actions[index].title,
                              style: TextStyle(
                                fontSize: _size.width / 32.5,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
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
                  height: _size.width * .7,
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
                            GestureDetector(
                              onTap: () => Get.toNamed('/voucher'),
                              child: Row(
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
                                    size: _size.width / 20.5,
                                  ),
                                ],
                              ),
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
                          itemCount: vouchers.length,
                          itemBuilder: (context, index) {
                            return VoucherCard(
                              index: index,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: _size.width * .46,
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
                      _buildHorizontalAction(context),
                      Expanded(
                          child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Card(
                          key: dataKey,
                          elevation: .0,
                          child: _buildHomeTab(context),
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
      ),
    );
  }

  Widget _buildHorizontalAction(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 4.0),
      height: _size.width * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentType = actions[index].title;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 8.0 : 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: _size.width * .165,
                    width: _size.width * .165,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: 1.15,
                          blurRadius: 1.25,
                          offset: Offset(.0, 3.5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      actions[index].icon,
                      size: _size.width / 20.5,
                      color: actions[index].color,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    actions[index].title,
                    style: TextStyle(
                      fontSize: _size.width / 30.0,
                      color: currentType == actions[index].title
                          ? Colors.blueAccent
                          : Colors.grey.shade800,
                      fontWeight: currentType == actions[index].title
                          ? FontWeight.bold
                          : FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHomeTab(context) {
    final _size = MediaQuery.of(context).size;
    return TabBar(
      onTap: (index) => Scrollable.ensureVisible(dataKey.currentContext),
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
          text: 'Nearby',
        ),
        Tab(
          text: 'Top Sales',
        ),
        Tab(
          text: 'Best Rated',
        ),
      ],
    );
  }
}
