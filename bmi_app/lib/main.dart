// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR APP',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0, // Remove the shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI Calculator",
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Developed by Saim",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                        hintText: 'Enter Weight in kg',
                        labelText: 'Weight in kg',
                        prefixIcon: Icon(Icons.accessibility),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                        hintText: 'Enter Height in ft',
                        labelText: 'Height in ft',
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                        labelText: "Height in inches",
                        hintText: "Enter Height in inches",
                        prefixIcon: Icon(Icons.height_outlined),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Calculate BMI
                        var weight = wtController.text.toString();
                        var feet = ftController.text.toString();
                        var inches = inController.text.toString();
                        if (weight == "" || feet == "" || inches == "") {
                          setState(() {
                            result = "Please enter all the fields";
                          });
                        } else {
                          // Calculate BMI
                          var doubleheightinInches =
                              (double.parse(feet) * 12) + double.parse(inches);
                          var doubleheightinCms = doubleheightinInches * 2.54;
                          var doubleHeightInMetre = doubleheightinCms / 100;
                          var doubleWeigtinKg = double.parse(weight);
                          var bmi = doubleWeigtinKg /
                              (doubleHeightInMetre * doubleHeightInMetre);
                          result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                          if (bmi > 25) {
                            bgColor = Colors.red.shade100;
                          } else if (bmi < 18.5) {
                            bgColor = Colors.yellow.shade100;
                          } else {
                            bgColor = Colors.green.shade100;
                          }
                          setState(() {
                            result = result;
                          });
                        }
                      },
                      child: Text(
                        'Calculate BMI',
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Set the background color
                        onPrimary: Colors.white, // Set the text color
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Image.network(
                      'https://img.freepik.com/free-vector/flat-woman-diet-control-normal-weight-with-bmi-scale_88138-933.jpg?t=st=1715589340~exp=1715592940~hmac=ed2ce246f42ea15daa654c91ee8c2b2ea2c86a98a5b2927b73da5d59612940a7&w=1380',
                      height: 100,
                      width: 600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
