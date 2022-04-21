import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasgoods/screens/home_page.dart';

void main() {
  runApp(const KasGoods());
}

class KasGoods extends StatelessWidget {
  const KasGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.greenAccent));
    return MaterialApp(
      title: "Kas Goods",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white
          ),
          elevation: 100,
          color: Color(0xff2A2D31),

        ),
      ),
      home: HomePage(),
    );
  }
}
