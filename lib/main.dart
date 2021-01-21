import 'package:bmi_calculator/bmicalculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BMI CALCULATOR'),
      // initialRoute: '/',
      routes: {
        // '/': (context) => MyHomePage(),
        'BMI': (context) => BMICalculator(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var genderSelected;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xfff28482),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: EdgeInsets.only(left: 80, right: 80),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Select Your Gender",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ButtonTheme(
                          height: 180,
                          minWidth: 200,
                          child: RaisedButton(
                            elevation: 20,
                            onPressed: () {
                              genderSelected = "Male";
                              Navigator.pushNamed(context, 'BMI',
                                  arguments: genderSelected);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "asset/man.png",
                                  width: 150,
                                  height: 150,
                                ),
                                Text("Male")
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xff118ab2),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0xffc8e7ff),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        ButtonTheme(
                          height: 180,
                          minWidth: 200,
                          child: RaisedButton(
                            elevation: 20,
                            onPressed: () {
                              genderSelected = "Female";
                              Navigator.pushNamed(context, 'BMI',
                                  arguments: genderSelected);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'asset/girl.png',
                                  height: 150,
                                  width: 150,
                                ),
                                Text("Female")
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xfff28482),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0xfffcd5ce),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        ButtonTheme(
                          height: 180,
                          minWidth: 200,
                          child: RaisedButton(
                            elevation: 40,
                            onPressed: () {
                              genderSelected = "Others";
                              Navigator.pushNamed(context, 'BMI',
                                  arguments: genderSelected);
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        'asset/man.png',
                                        width: 85,
                                        height: 130,
                                      ),
                                    ),
                                    Container(
                                      child: Image.asset(
                                        'asset/girl.png',
                                        width: 85,
                                        height: 130,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [Text("Others")],
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff2d6a4f)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color(0xff95d5b2),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
