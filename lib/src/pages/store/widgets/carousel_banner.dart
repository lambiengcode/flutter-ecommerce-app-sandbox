import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CarouselBanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  var _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1540555700478-4be289fbecef?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8Y29zbWV0aWNzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1585519356004-2bd6527d9cbe?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fGNvc21ldGljc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1593487568720-92097fb460fb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjJ8fGNvc21ldGljc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1591375275714-8b2b55b0bf0d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDR8fGNvc21ldGljc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1594490556719-16dcd6b1eb3d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTB8fGNvc21ldGljc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  void changePostion(int i) {
    setState(() {
      if (_current == 4 && i == 1) {
        _current = 0;
      } else if (_current == 0 && i == -1) {
        _current = 4;
      } else {
        _current += i;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: _size.height * .15,
            aspectRatio: 1 / 1,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: imgList.map((imgUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imgList[_current]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8.0,
          child: Container(
            width: _size.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _current = index;
                    });
                  },
                  child: Container(
                    width: _current == index ? 16.0 : 10.0,
                    height: _current == index ? 8.0 : 6.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      color: _current == index
                          ? Colors.white
                          : Colors.white.withOpacity(.9),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                color: Colors.white,
                icon: Icon(
                  Feather.arrow_left,
                  size: _size.width / 15.0,
                ),
                onPressed: () {
                  changePostion(-1);
                },
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(
                  Feather.arrow_right,
                  size: _size.width / 15.0,
                ),
                onPressed: () {
                  changePostion(1);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
