import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:now/src/widgets/loading.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback toggleView;

  LoginPage({this.toggleView});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode textFieldFocus = FocusNode();
  String email = '';
  String password = '';

  bool hidePassword = true;
  bool loading = false;
  bool rememberPsw = false;

  hideKeyboard() => textFieldFocus.unfocus();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Container(
                  height: _size.height * .42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1551077377-cda42c0990ae?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDl8fGxvdHVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: _size.height * .34,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.08),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFABBAD5),
                                      spreadRadius: .8,
                                      blurRadius: 1.5,
                                      offset: Offset(
                                        0,
                                        1.5,
                                      ), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 12.0),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: _size.width / 24,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        validator: (val) => val.length == 0
                                            ? 'Enter your Email'
                                            : null,
                                        onChanged: (val) => email = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Số thẻ hội viên',
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: _size.width / 26.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      thickness: .4,
                                      height: .4,
                                      indent: 18.0,
                                      endIndent: 18.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: _size.width / 24,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        focusNode: textFieldFocus,
                                        validator: (val) => val.length == 0
                                            ? 'Nhập mật khẩu'
                                            : null,
                                        onChanged: (val) =>
                                            password = val.trim(),
                                        obscureText: hidePassword,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Mật khẩu',
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: _size.width / 26.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          suffix: Text(
                                            'Quên mật khẩu?',
                                            style: TextStyle(
                                              color: Color(0xFFC59A55),
                                              fontSize: _size.width / 32.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      thickness: .4,
                                      height: .4,
                                      indent: 18.0,
                                      endIndent: 18.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 10.0,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            rememberPsw = !rememberPsw;
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 4.0),
                                            Container(
                                              height: 24.0,
                                              width: 24.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: rememberPsw
                                                    ? Color(0xFFC59A55)
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: rememberPsw
                                                        ? Color(0xFFC59A55)
                                                        : Colors.grey,
                                                    width: 1.8),
                                              ),
                                              alignment: Alignment.center,
                                              child: rememberPsw
                                                  ? Icon(
                                                      Feather.check,
                                                      size: 12.5,
                                                      color: Colors.white,
                                                    )
                                                  : Text(''),
                                            ),
                                            SizedBox(width: 6.0),
                                            Text(
                                              "Lưu mật khẩu",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: _size.width / 30.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {}
                                },
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Color(0xFFC59A55),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Đăng nhập",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              GestureDetector(
                                onTap: () {
                                  widget.toggleView();
                                },
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color(0xFFC59A55),
                                      width: 1.2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Quý khách chưa phải là hội viên? Tiếp tục",
                                      style: TextStyle(
                                        color: Color(0xFFC59A55),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
