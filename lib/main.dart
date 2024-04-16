import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawsitive/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffffffff),
        fontFamily: 'Nanum',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
