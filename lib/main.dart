import 'package:flutter/material.dart';
import 'HomePage.dart';

void main(){
  runApp(MaterialApp(
    title: "Api Crud",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
