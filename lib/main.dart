import 'package:calcii/pages/home.dart';
import 'package:flutter/material.dart';
void main(){
  return runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home() ,

    );
  }

}
