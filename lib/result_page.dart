import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';

class ResultPage extends StatelessWidget {
  final String  bmiResult;
  final String resultText;
  final String adviceText;

  ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.adviceText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveCardCoulor,
        title:
        Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 5,
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kActiveCardCoulor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          color: resultText == 'Normal' ?
                          Colors.green:
                          (resultText == 'Overweight'
                              ? Colors.red
                              : Colors.orange),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      adviceText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child:Container(
              color: kBottomContainerCoulor,
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: kBottomContainerHeight,
             child:Center(
               child: Text(
                 'RE-CALCULATE', style: kLargeBottonTextStyle,
               ),
             ) ,
            ),
          ),
        ],
      ),
    );
  }
}