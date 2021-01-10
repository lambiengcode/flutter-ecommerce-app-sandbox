import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:now/src/widgets/loading.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback toggleView;

  SignupPage({this.toggleView});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
            appBar: AppBar(
              elevation: .0,
              backgroundColor: Colors.white,
              centerTitle: true,
              brightness: Brightness.light,
              leading: IconButton(
                onPressed: () => widget.toggleView(),
                icon: Icon(
                  Feather.arrow_left,
                  color: Color(0xFF2C3D50),
                  size: _size.width / 15.0,
                ),
              ),
              title: Text(
                'Đăng ký hội viên',
                style: TextStyle(
                  color: Color(0xFF2C3D50),
                  fontSize: _size.width / 21.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 12.0),
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
                                            ? 'Nhập email của bạn'
                                            : null,
                                        onChanged: (val) => email = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Email',
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
                                        validator: (val) => val.length == 0
                                            ? 'Nhập họ tên của bạn'
                                            : null,
                                        onChanged: (val) => email = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Họ và Tên',
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
                                        validator: (val) => val.length == 0
                                            ? 'Nhập số điện thoại của bạn'
                                            : null,
                                        onChanged: (val) => email = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Số điện thoại',
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
                                        validator: (val) => val.length == 0
                                            ? 'Nhập số chứng minh của bạn'
                                            : null,
                                        onChanged: (val) => email = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'Số CMND/CCCD',
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
                                        validator: (val) =>
                                            val.trim() != password
                                                ? 'Mật khẩu không trùng khớp'
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
                                          labelText: 'Nhập lại mật khẩu',
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: _size.width / 26.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: .0),
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
                                      "Đăng ký",
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
                                      "Quý khách đã là hội viên? Đăng nhập",
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
