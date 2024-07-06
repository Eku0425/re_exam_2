import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Scrren/HomeScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black12,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return studentAPP();
  }
}

class studentAPP extends StatefulWidget {
  const studentAPP({super.key});

  @override
  State<studentAPP> createState() => _studentAPPState();
}

class _studentAPPState extends State<studentAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Data',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
