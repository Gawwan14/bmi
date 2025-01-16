import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/round_icon.dart';

import 'constant.dart';
import 'result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: InputScreen(),
    );
  }
}
enum Gender  {Male,Female}
class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectGender=Gender.Male;
  int height=100;
  int weight=60;
  int age =20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveCardCoulor,
        title:
        Center(child: Text("Bmi Calculator",)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Expanded(

              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap:(){
                          setState(() {
                            selectGender=Gender.Male;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: selectGender==Gender.Male?kActiveCardCoulor:kInactiveCardCoulor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.mars,
                                size: 60,
                              ),
                              Text("Male",style: kLableTextStyle,),
                            ],
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap:(){
                          setState(() {
                            selectGender=Gender.Female;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: selectGender==Gender.Female?kActiveCardCoulor:kInactiveCardCoulor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.venus,
                                size: 60,
                              ),
                              Text("Female",style: kLableTextStyle,),
                            ],
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kActiveCardCoulor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: kNumberTextStyle,),
                      Text("cm",style: kLableTextStyle,),
                    ],
                  ),
                  Slider(
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      }
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: kActiveCardCoulor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Weight",style: kLableTextStyle,),
                            Text(weight.toString(),style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                    }
                                ),
                                SizedBox(width: 10,),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    }
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kActiveCardCoulor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("age",style: kLableTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  }
                              ),
                              SizedBox(width: 10,),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  }
                              ),

                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                ],

              ),
          ),
          GestureDetector(
            onTap: ()
            {
              CalculationBrain calc = CalculationBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                adviceText: calc.getAdvice(),
              ),));
            },
            child: Container(
              color: kBottomContainerCoulor,
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'CALCULATE', style: kLargeBottonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CalculationBrain{
  CalculationBrain({required this.height, required this.weight});
  final height;
  final weight;
  double bmi = 0;
  String calculateBMI(){
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(bmi >= 25){
      return 'overweight';
    }
    else if(bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String getAdvice(){
    if(bmi >= 25){
      return 'You have a higher weight you should do exerices';
    }
    else if(bmi > 18.5){
      return 'You have a normal body, save it';
    }
    else{
      return 'You have a underweight body you should eat more but healthy food';
    }
  }
}


