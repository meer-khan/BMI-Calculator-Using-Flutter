import 'dart:ui';

import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  extra(gender) {
    // Container(
    //             decoration: BoxDecoration(),
    //             child: gender == 'Male'
    //                 ? Align(
    //                     alignment: Alignment(100, 100),
    //                     // decoration: BoxDecoration(),
    //                     child: Image.asset(
    //                       'asset/man.png',
    //                       height: 200,
    //                       alignment: Alignment.topLeft,
    //                     ),
    //                   )
    //                 : Image.asset(
    //                     'asset/girl.png',
    //                     height: 200,
    //                   ),
    //           ),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Column(
    //             children: [
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                     color: Colors.blue,
    //                     borderRadius: BorderRadius.circular(15)),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text(
    //                     "Weight in KG",
    //                     style: TextStyle(color: Colors.white, fontSize: 15),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 width: 150,
    //                 height: 100,
    //                 child: Align(
    //                   alignment: Alignment.centerLeft,
    //                   child: Material(
    //                     child: TextField(
    //                       keyboardType: TextInputType.number,
    //                       decoration:
    //                           InputDecoration(hintText: "Enter weight"),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                     color: Colors.blue,
    //                     borderRadius: BorderRadius.circular(15)),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text(
    //                     "Height in Feet",
    //                     style: TextStyle(color: Colors.white, fontSize: 15),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 width: 150,
    //                 height: 100,
    //                 child: Align(
    //                   alignment: Alignment.centerLeft,
    //                   child: Material(
    //                     child: TextField(
    //                       keyboardType: TextInputType.number,
    //                       decoration:
    //                           InputDecoration(hintText: "Enter Meters"),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           );
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
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(hintText: "Enter Meters"),
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
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
                    child: Column(children: [Text("Your Calculated BMI is")]),

                    // width: MediaQuery.of(context).size.width,
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
