import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = '';

  Widget calcbutton(var value) {
    return Container(
        width: 100,
        height: 100,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                result = result + value;
              });
            },
            child: Text(
              value,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            style: ElevatedButton.styleFrom(primary: Color(0xff008080))));
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  equal() {
    Parser par = Parser();
    Expression exp = par.parse(result);
    ContextModel cm = ContextModel();
    double answer = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = answer.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              result,
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              calcbutton('7'),
              calcbutton('8'),
              calcbutton('9'),
              calcbutton('*'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              calcbutton('4'),
              calcbutton('5'),
              calcbutton('6'),
              calcbutton('-'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              calcbutton('1'),
              calcbutton('2'),
              calcbutton('3'),
              calcbutton('+'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: clear,
                      child: Text(
                        'C',
                        style: TextStyle(fontSize: 28),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.red))),
              calcbutton('0'),
              calcbutton('/'),
              Container(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: equal,
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 28),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.red))),
            ],
          ),
        ],
      ),
    ));
  }
}
