import 'dart:ui';
import 'dart:math';
// import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  var bmi;

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  _calculateBMI(height, weight) {
    height = double.parse(height.text);
    weight = double.parse(weight.text);
    var bmi = weight / pow(height, 2);
    bmi = bmi.toStringAsFixed(2);
    bmi = double.parse(bmi);
    print(bmi.runtimeType);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    final gender = ModalRoute.of(context).settings.arguments;
    print(gender);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: gender == 'Male'
                          ? Image.asset(
                              'asset/man.png',
                              // height: 200,
                              alignment: Alignment.topLeft,
                            )
                          : Image.asset(
                              'asset/girl.png',
                              // height: 200,
                            ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Weight in KG",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 80,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Material(
                                child: TextField(
                                  controller: weightController,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(hintText: "Enter weight"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Height in Feet",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 80,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Material(
                                child: TextField(
                                  controller: heightController,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(hintText: "Enter Meters"),
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              print(heightController.text);
                              bmi = _calculateBMI(
                                  heightController, weightController);
                              print(bmi);
                              this.setState(() {});
                            },
                            child: Text("CALCULATE"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.deepPurple,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Your Calculated BMI is",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
