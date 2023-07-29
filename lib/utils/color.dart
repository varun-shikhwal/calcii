import 'package:flutter/material.dart';

getcolor(String text){
  if(
  text == "/" ||
  text == "*" ||
  text == "+" ||
  text == "-" ||
  text == "c" ||
  text == "(" ||
  text == ")"
  ){
    return Color.fromARGB(255, 252, 100, 100);
  }
  return Colors.white;
}
getbgcolor(String text){

  if(text=='AC'){
    return Color.fromARGB(255, 252, 100, 100);
  }
  if(text=='='){
    return Color.fromARGB(255, 104, 204, 159);
  }
  return Color(0xFF1d2630);
}

