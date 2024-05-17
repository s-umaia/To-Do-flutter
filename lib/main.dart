import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/pages/HomePage.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( 
      debugShowCheckedModeBanner:false,
      home: Container(
        width: double.infinity, // Set the desired width
        height: 500,
        child: HomePage(),
      ),
    );
  }
}