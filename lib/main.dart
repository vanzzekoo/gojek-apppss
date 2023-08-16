import 'package:flutter/material.dart';
import 'package:gojek_app/profile_screen.dart';
import 'package:gojek_app/edit_profile_screen.dart' as EditProfileScreenPage;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojek App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProfileScreen(),
        '/editProfile': (context) => EditProfileScreen(),
      },
    );
  }
}
