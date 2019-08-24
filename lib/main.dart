import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isValidated = false;

  @override
  void initState() {
    super.initState();
    getLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: isValidated ? HomePage() : LoginPage());
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (_pref.containsKey('isLoggedIn') && _pref.getBool('isLoggedIn')) {
      setState(() {
        isValidated = true;
        print('isValidated: $isValidated');
      });
      return true;
    } else {
      print('isValidated: $isValidated');
      return false;
    }
  }

}