import 'package:flutter/material.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/register_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //set initial router
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        '/register': (context) => Signup(),
      },
    );
  }
}
