// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:ui';

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
  var bgColor = Color.fromARGB(137, 229, 255, 200);
  var bggrad = RadialGradient(
    center: Alignment.topLeft,
    radius: 2.0,
    colors: [
      Color.fromARGB(126, 255, 190, 136), // Start color
      Colors.white, // End color
    ],
  );

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
        decoration: BoxDecoration(
          gradient: bggrad,
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Developed by Saim",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                     SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Enter the following details to calculate BMI",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                            bgColor = Colors.redAccent;
                          } else if (bmi < 18.5) {
                            bgColor = Colors.yellowAccent;
                          } else {
                            bgColor = Colors.greenAccent;
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
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Image.asset(
                      'media/bmi.png',
                      width: 400,
                      height: 230,
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
