import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:now/src/models/access.dart';
import 'package:now/src/pages/save/widgets/save_card.dart';

class SavePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  String type = 'Cocktail';
  List<String> types = [];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52.0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: .0,
        centerTitle: true,
        title: Text(
          'Saved',
          style: TextStyle(
            fontSize: _size.width / 21.5,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFABBAD5),
                    spreadRadius: .8,
                    blurRadius: 2.0,
                    offset: Offset(0, 2.0), // changes position of shadow
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  icon: Icon(
                    Feather.list,
                    size: _size.width / 16.0,
                    color: Colors.grey.shade700,
                  ),
                  iconEnabledColor: Colors.grey.shade800,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: type,
                  items: actions.map((state) {
                    return DropdownMenuItem(
                        value: state.title,
                        child: Text(
                          state.title,
                          style: TextStyle(
                            fontSize: _size.width / 24,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      type = val;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SaveCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
