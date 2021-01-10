import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:location/location.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  PickResult selectedPlace;
  LocationData currentLocation;
  Future<dynamic> _myLocation;

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

  void chooseLocation(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PlacePicker(
            apiKey: "AIzaSyANh3dtxFqZNVJOx1IVil1Wd4d_aQ_99BA",
            initialPosition: MyAddressPage.kInitialPosition,
            useCurrentLocation: true,
            selectInitialPosition: true,
            onGeocodingSearchFailed: (error) => print(error),

            //usePlaceDetailSearch: true,
            onPlacePicked: (result) {
              selectedPlace = result;
              Navigator.of(context).pop();
              setState(() {});
            },
            forceSearchOnZoomChanged: true,
            automaticallyImplyAppBarLeading: false,
            autocompleteLanguage: "vi",
            region: 'vn',
            // selectedPlaceWidgetBuilder:
            //     (_, selectedP, state, isSearchBarFocused) {
            //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
            //   return isSearchBarFocused
            //       ? Container()
            //       : FloatingCard(
            //           bottomPosition:
            //               0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
            //           leftPosition: 0.0,
            //           rightPosition: 0.0,
            //           width: 500,
            //           borderRadius: BorderRadius.circular(12.0),
            //           child: state == SearchingState.Searching
            //               ? Center(child: CircularProgressIndicator())
            //               : RaisedButton(
            //                   child: Text("Pick Here"),
            //                   onPressed: () {
            //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
            //                     //            this will override default 'Select here' Button.
            //                     print("do something with [selectedPlace] data");
            //                     selectedPlace = selectedP;
            //                     Navigator.of(context).pop();
            //                   },
            //                 ),
            //         );
            // },
            pinBuilder: (context, state) {
              if (state == PinState.Idle) {
                return CircleAvatar(
                  radius: 12.0,
                  backgroundImage: AssetImage('images/avt.jpg'),
                );
              } else {
                return CircleAvatar(
                  radius: 12.0,
                  backgroundImage: AssetImage('images/avt.jpg'),
                );
              }
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _myLocation = getUserLocation();
  }

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
            size: _size.width / 16.0,
            color: Colors.grey.shade800,
          ),
        ),
        title: Text(
          'Delivery Address',
          style: TextStyle(
            fontSize: _size.width / 21.5,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: _size.width * .32),
              child: Divider(
                color: Colors.grey.shade400,
                thickness: .4,
                height: .4,
              ),
            ),
            _buildCurrentLocation(
              context,
              'Current Location',
              selectedPlace == null ? "" : selectedPlace.formattedAddress,
              FontAwesomeIcons.mapMarkerAlt,
            ),
            SizedBox(height: 16.0),
            _buildActionLine(
              context,
              'Home Address',
              selectedPlace == null
                  ? ""
                  : selectedPlace.formattedAddress.substring(0, 7) + '...',
              FontAwesomeIcons.home,
            ),
            SizedBox(height: 4.0),
            _buildActionLine(
              context,
              'Work Address',
              selectedPlace == null
                  ? ""
                  : selectedPlace.formattedAddress.substring(0, 7),
              FontAwesomeIcons.briefcase,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionLine(context, title, value, icon) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Current Location':
            chooseLocation(context);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: _size.width / 22.5,
                  color: Colors.grey.shade700,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: _size.width / 26.8,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
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
                    fontSize: _size.width / 27.5,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade700,
                  size: _size.width / 24.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentLocation(context, title, value, icon) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Current Location':
            chooseLocation(context);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: _size.width / 22.5,
              color: Colors.grey.shade700,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  value != ''
                      ? Text(
                          value,
                          style: TextStyle(
                            fontSize: _size.width / 26.8,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : FutureBuilder(
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
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    'lambiengcode',
                    style: TextStyle(
                      fontSize: _size.width / 24.0,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
