import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomBuy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomBuyState();
}

class _BottomBuyState extends State<BottomBuy> {
  int count = 1;

  TextEditingController _sizeSController = new TextEditingController();
  TextEditingController _sizeMController = new TextEditingController();
  TextEditingController _sizeLController = new TextEditingController();

  moneyToString(String money) {
    String result = '';
    int count = 0;
    for (int i = money.length - 1; i >= 0; i--) {
      if (count == 3) {
        count = 1;
        result += ',';
      } else {
        count++;
      }
      result += money[i];
    }
    String need = '';
    for (int i = result.length - 1; i >= 0; i--) {
      need += result[i];
    }
    return need;
  }

  @override
  void initState() {
    super.initState();

    _sizeSController.text = moneyToString('39000');
    _sizeMController.text = moneyToString('49000');
    _sizeLController.text = moneyToString('59000');
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            8.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Feather.arrow_left,
                    size: _size.width / 16.0,
                    color: Colors.grey.shade800,
                  ),
                ),
                Container(),
                Text(
                  'Add New Item',
                  style: TextStyle(
                    fontSize: _size.width / 23.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                Container(),
                Container(),
                Container(),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Divider(
              height: .25,
              thickness: .25,
              color: Colors.grey,
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: _size.width * .2,
                    width: _size.width * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage('images/avt.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    height: _size.width * .2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Coffee Sofresh',
                              style: TextStyle(
                                fontSize: _size.width / 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              '40 sold | 4 likes',
                              style: TextStyle(
                                fontSize: _size.width / 28.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '39,000đ',
                          style: TextStyle(
                            fontSize: _size.width / 26.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              child: Text(
                "Quantity",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: _size.width / 24.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: .25,
              height: .25,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (count != 1) {
                        count--;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      14.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: .8,
                          blurRadius: 2.0,
                          offset: Offset(0, 2.0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Feather.minus,
                      color: Colors.grey.shade600,
                      size: _size.width / 18.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 16.0, right: 12.0, top: 15.0, bottom: 15.0),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: .8,
                          blurRadius: 2.0,
                          offset: Offset(0, 2.0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: _size.width / 24.0,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      14.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABBAD5),
                          spreadRadius: .8,
                          blurRadius: 2.0,
                          offset: Offset(0, 2.0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Feather.plus,
                      color: Colors.blueAccent,
                      size: _size.width / 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              child: Text(
                "Size",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: _size.width / 24.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: .25,
              height: .25,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 12.0,
            ),
            _buildPriceSize(context, 'S'),
            SizedBox(
              height: 12.0,
            ),
            _buildPriceSize(context, 'M'),
            SizedBox(
              height: 12.0,
            ),
            _buildPriceSize(context, 'L'),
            SizedBox(
              height: 24.0,
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: .25,
              height: .25,
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Total: 39,000đ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: _size.width / 26.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: .8,
                              blurRadius: 2.0,
                              offset:
                                  Offset(0, 2.0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _size.width / 26.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceSize(context, title) {
    final _size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 24.0,
        ),
        Container(
          height: 50.0,
          width: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              6.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFABBAD5),
                spreadRadius: 1.85,
                blurRadius: 1.85,
                offset: Offset(2.0, 2.5), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Container(
            height: 52.0,
            padding: EdgeInsets.fromLTRB(24.0, 2.0, 16.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                6.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFABBAD5),
                  spreadRadius: 1.85,
                  blurRadius: 1.85,
                  offset: Offset(2.0, 2.5), // changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              enabled: false,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TextInputFormatter.withFunction((oldValue, newValue) {
                  if (newValue.text.isEmpty) {
                    return newValue.copyWith(text: '');
                  } else if (newValue.text.compareTo(oldValue.text) != 0) {
                    final int selectionIndexFromTheRight =
                        newValue.text.length - newValue.selection.end;
                    final f = NumberFormat("#,###");
                    final number = int.parse(
                        newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
                    final newString = f.format(number);
                    return TextEditingValue(
                      text: newString,
                      selection: TextSelection.collapsed(
                          offset:
                              newString.length - selectionIndexFromTheRight),
                    );
                  } else {
                    return newValue;
                  }
                })
              ],
              controller: title == 'S'
                  ? _sizeSController
                  : title == 'L'
                      ? _sizeLController
                      : _sizeMController,
              style: TextStyle(
                color: Colors.black87,
                fontSize: _size.width / 26,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.end,
              validator: (val) => val.length == 0 ? 'Enter your Email' : null,
              decoration: InputDecoration(
                suffixText: ' đ',
                suffixStyle: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
                hintText: "0",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: _size.width / 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 24.0,
        ),
      ],
    );
  }
}
