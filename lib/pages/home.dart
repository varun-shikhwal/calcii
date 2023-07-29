import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../utils/color.dart';
class home extends StatefulWidget{
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String userInput="";
  String result="0";

  List<String> buttonList=[
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'c',
    '0',
    '.',
    '=',
  ];

  Widget CustomButton(String text){
    return InkWell(
      splashColor:   Color(0xFF1d2630),
      onTap: (){
        setState(() {
          handleButton(text);
        });
      },
      child: Ink(
        decoration:BoxDecoration(
          color: getbgcolor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: 3,
              offset: Offset(-2,-2),
            )
          ],
        ) ,
        child: Center(
          child: Text(
              text,
              style: TextStyle(
                  color: getcolor(text),
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              )
          ),
        ),
      ),
    );
  }
  handleButton(String text){
    if('AC'==text){
      userInput="";
      result="0";
      return;
    }
    if('c'==text){
      if(userInput.isNotEmpty){
        userInput=userInput.substring(0,userInput.length-1);
        return;
      }
      else{
        return null;
      }
    }
    if(text=="="){
      result=calculate();
      userInput=result;
      if(userInput.endsWith(".0")) {
        userInput = userInput.replaceAll(".0", "");
      }
      if(result.endsWith(".0")){
        result=result.replaceAll(".0", "");
        return;
      }
    }
    userInput=userInput+text;
  }
  String calculate(){
    try{
      var exp=Parser().parse(userInput);
      var evaluation=exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    }catch(e){
      return "Error";
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF1d2630),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/3,
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                Container(
                  padding:EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.white,height: 2,),
          Expanded(child: Container(
            child: GridView.builder(
              itemCount: buttonList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,crossAxisSpacing: 12,mainAxisSpacing: 12,
            ), itemBuilder: (BuildContext context, int index) {
                return CustomButton(buttonList[index]);
            }),
          ))
        ],
      ),
    );
  }
}
