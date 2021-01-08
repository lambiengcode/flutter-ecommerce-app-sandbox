import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _payMethod = 'Cash';
  String _schedule = '6 AM';
  bool _more = false;

  LocationData currentLocation;
  Future<dynamic> _myLocation;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
    return result;
  }

  @override
  void initState() {
    super.initState();
    _myLocation = getUserLocation();
    _schedule = 'Now';
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 2.0,
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
          'Confirm Order',
          style: TextStyle(
            fontSize: _size.width / 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDeliveryAddress(context),
                    Divider(
                      color: Colors.grey.shade400,
                      indent: 12.0,
                      endIndent: 12.0,
                      thickness: .25,
                      height: .25,
                    ),
                    _buildSchedule(context),
                    SizedBox(height: 12.0),
                    Container(
                      width: _size.width,
                      padding: EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFABBAD5),
                            spreadRadius: .0,
                            blurRadius: 1.25,
                            offset:
                                Offset(.0, 1.8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Highlands Coffee Nguyễn An Ninh',
                            style: TextStyle(
                              fontSize: _size.width / 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          _buildProductCard(context),
                          _buildProductCard(context),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.shade400,
                                  thickness: .4,
                                  height: .4,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _more = !_more;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        _more ? 'Show Hide' : 'Show More',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: _size.width / 28.5,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.shade400,
                                  thickness: .4,
                                  height: .4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    _buildTotal(context),
                    SizedBox(height: 8.0),
                    _buildExtentions(context),
                  ],
                ),
              ),
            ),
            _buildBottomPayment(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.width * .42,
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery to',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: _size.width / 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: _size.width * .25,
                width: _size.width * .25,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  tiltGesturesEnabled: false,
                  mapType: MapType.terrain,
                  initialCameraPosition: _kGooglePlex,
                  myLocationButtonEnabled: false,
                  buildingsEnabled: false,
                  compassEnabled: false,
                  mapToolbarEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 22.0,
                      ),
                      Text(
                        'lambiengcode - 0989917877',
                        style: TextStyle(
                          fontSize: _size.width / 22.5,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      FutureBuilder(
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
                                snapshot.data.toString(),
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: _size.width / 26.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Edit Address',
                  style: TextStyle(
                    color: Colors.blueAccent.shade400,
                    fontSize: _size.width / 26.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSchedule(context) {
    final _size = MediaQuery.of(context).size;

    void selectedTimeOpen() async {
      TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        },
      );

      setState(() {
        _schedule = picked.format(context);
      });
    }

    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFABBAD5),
            spreadRadius: .0,
            blurRadius: 1.25,
            offset: Offset(.0, 1.8), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Feather.clock,
                color: Colors.grey.shade900,
                size: _size.width / 22.5,
              ),
              SizedBox(width: 6.0),
              Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: _size.width / 24.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => selectedTimeOpen(),
            child: Text(
              _schedule,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: _size.width / 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotal(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFABBAD5),
            spreadRadius: .0,
            blurRadius: 1.25,
            offset: Offset(.0, 1.8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLineTotal(context, 'Subtotal (2 items)', '78,000 đ'),
          _buildLineTotal(context, 'Shipping fee (2.4 km)', '15,000 đ'),
          _buildLineTotal(context, 'Total', '93,000 đ'),
        ],
      ),
    );
  }

  Widget _buildExtentions(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFABBAD5),
            spreadRadius: .0,
            blurRadius: 1.25,
            offset: Offset(.0, 1.8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLineExtentions(
              context, 'Add Voucher', 'DISCOUNT 50%...', Feather.tag),
          _buildLineExtentions(
              context, 'Use Coins', '10000 Points', Feather.airplay),
          _buildLineExtentions(context, 'Note', 'Giao h...', Feather.edit),
        ],
      ),
    );
  }

  Widget _buildBottomPayment(context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: _size.height * .2,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFABBAD5),
              spreadRadius: 2.4,
              blurRadius: 1.25,
              offset: Offset(.0, 1.8), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                _buildPaymentMethod(context, 'Cash'),
                SizedBox(width: 10.0),
                _buildPaymentMethod(context, 'Airpay'),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: _size.height * .07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade400,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                'Submit - 88,000đ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _size.width / 26.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(context, title) {
    final _size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _payMethod = title;
          });
        },
        child: Container(
          height: _size.height * .07,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: title == _payMethod
                  ? Colors.blueAccent.shade200
                  : Colors.grey.shade400,
              width: 2.0,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: title == _payMethod
                  ? Colors.blueAccent.shade400
                  : Colors.grey,
              fontSize: _size.width / 24.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineTotal(context, title, value) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(.0, 4.0, 4.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w600,
              fontSize: _size.width / 24.0,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w400,
              fontSize: _size.width / 24.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineExtentions(context, title, value, icon) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(.0, 2.0, 8.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.grey.shade800,
                size: _size.width / 20.0,
              ),
              SizedBox(width: 12.0),
              Padding(
                padding: EdgeInsets.only(top: 2.5),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w600,
                    fontSize: _size.width / 24.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w400,
                  fontSize: _size.width / 24.0,
                ),
              ),
              SizedBox(width: 6.0),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade600,
                size: _size.width / 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: _size.width * .16,
                width: _size.width * .16,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.highlandscoffee.com.vn/vnt_upload/weblink/HCO-7548-PHIN-SUA-DA-2019-TALENT-WEB_1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '1x ',
                      style: TextStyle(
                        fontSize: _size.width / 24.0,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: 'Coffee Sofresh',
                      style: TextStyle(
                        fontSize: _size.width / 24.0,
                        color: Colors.blueAccent.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            '39,000 đ',
            style: TextStyle(
              color: Colors.black,
              fontSize: _size.width / 26.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
