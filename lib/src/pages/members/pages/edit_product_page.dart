import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:now/src/pages/members/widgets/bottom_delete.dart';

class EditProductPage extends StatefulWidget {
  final String urlToImage;
  final String title;
  final String sizeS;
  final String sizeM;
  final String sizeL;
  EditProductPage({
    this.urlToImage,
    this.title,
    this.sizeS,
    this.sizeM,
    this.sizeL,
  });
  @override
  State<StatefulWidget> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  File _image;
  String _title;
  String _sizeS;
  String _sizeM;
  String _sizeL;
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _sizeSController = new TextEditingController();
  TextEditingController _sizeMController = new TextEditingController();
  TextEditingController _sizeLController = new TextEditingController();

  void showDeleteBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomDelete();
      },
    );
  }

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
    _title = widget.title;
    _sizeS = widget.sizeS;
    _sizeM = widget.sizeM;
    _sizeL = widget.sizeL;

    _titleController.text = widget.title;
    _sizeSController.text = moneyToString(widget.sizeS);
    _sizeMController.text = moneyToString(widget.sizeM);
    _sizeLController.text = moneyToString(widget.sizeL);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _image == null
                      ? Container(
                          padding: EdgeInsets.only(
                            top: _size.height / 22.0,
                          ),
                          height: _size.height * .35,
                          width: _size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.urlToImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(),
                  Container(
                    padding: EdgeInsets.only(
                      top: _size.height / 22.0,
                    ),
                    height: _size.height * .35,
                    width: _size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Feather.arrow_left,
                            color: Colors.white.withOpacity(.85),
                            size: _size.width / 15.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () => showDeleteBottomSheet(),
                          icon: Icon(
                            Feather.trash,
                            color: Colors.white.withOpacity(.85),
                            size: _size.width / 16.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[200]))),
                child: TextFormField(
                  controller: _titleController,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: _size.width / 24,
                    fontWeight: FontWeight.w600,
                  ),
                  validator: (val) => val.length == 0 ? 'Enter Title' : null,
                  onChanged: (val) => _title = val.trim(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 2.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2.5,
                      ),
                    ),
                    hintText: "Title",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: _size.width / 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Text(
                  'Price for Size',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: _size.width / 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
              GestureDetector(
                onTap: () => Navigator.of(context).pop(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: .8,
                        blurRadius: 2.0,
                        offset: Offset(0, 2.0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _size.width / 26.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              onChanged: (val) => title == 'S'
                  ? _sizeS = val.trim()
                  : title == 'L'
                      ? _sizeL = val.trim()
                      : _sizeM = val.trim(),
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
