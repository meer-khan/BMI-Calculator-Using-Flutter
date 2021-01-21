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
  var bmiRangeCheck = '';
  double height = 0.0;
  double weight = 0.0;
  bool validateHeight = false;
  bool validateWeight = false;

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

  _bmiChecker(bmi, gender) {
    var str;
    print(bmi.runtimeType);
    // For Male
    if (gender == 'Male') {
      if (bmi >= 18.5 && bmi <= 24.9) {
        str = 'Helloo darling you are in perfect range';
      }
      if (bmi < 18.5) {
        str = 'Weight barhaoo sahiibb , mar jao gayee';
      }
      if (bmi > 24.9) {
        str = 'km Khaya Kar Motay Gadhay';
      }
    }

    // For Female
    if (gender == 'Female') {
      if (bmi >= 18.5 && bmi <= 24.9) {
        str = 'Helloo darling you are in perfect range';
      }
      if (bmi < 18.5) {
        str = 'Weight barhaoo Mohatrma , mar jao gii nai touu';
      } else {
        str = 'km Khaya Kar motiiii thonsss';
      }
    }
    return str;
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
                                  decoration: InputDecoration(
                                      hintText: "Enter weight",
                                      errorText: validateWeight
                                          ? "Weight can't be empty"
                                          : null),
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
                                "Height in Meter",
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
                                  decoration: InputDecoration(
                                      hintText: "Enter Meters",
                                      errorText: validateHeight
                                          ? "Heght can't be empty"
                                          : null),
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                heightController.text.isEmpty
                                    ? validateHeight = true
                                    : validateHeight = false;
                                weightController.text.isEmpty
                                    ? validateWeight = true
                                    : validateWeight = false;
                              });
                              print("H: $height");
                              print("W: $weight");
                              print("TH ${height.runtimeType}");

                              print("WH ${weight.runtimeType}");

                              bmi = _calculateBMI(
                                  heightController, weightController);

                              bmiRangeCheck = _bmiChecker(bmi, gender);

                              height = double.parse(heightController.text);
                              weight = double.parse(weightController.text);

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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "BMI Results",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Divider(
                            color: Color(0xffffc764),
                            thickness: 1,
                            endIndent: 65,
                            indent: 65,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            weight == 0.0
                                ? " "
                                : 'Weight: ${weightController.text} Kg',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            height == 0.0
                                ? ""
                                : 'Height: ${heightController.text} Meter',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          height == 0.0
                              ? SizedBox(
                                  height: 1,
                                )
                              : Divider(
                                  color: Color(0xffffc764),
                                  thickness: 1,
                                  endIndent: 65,
                                  indent: 65,
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            bmi == null ? "" : "BMI: $bmi",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(bmiRangeCheck,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green)),
                        ],
                      ),
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
