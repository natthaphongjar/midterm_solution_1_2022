import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Celsius.dart';
import '../../Fahrenheit.dart';
import '../../kevin.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Output = "";
  var _Controller = TextEditingController();

  Widget addbutton(String str, int i) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: () => {click(i)}, child: Text(str)),
    );
  }

  void Ctof() {
    double? cal = double.tryParse(_Controller.text);
    if(cal==null){
      setState(() {
        Output="Input Error !!!";
      });
    }else{
      var ans = C.c_f(cal);
      setState(() {
        Output = "${_Controller.text} Celsius = $ans Fahrenheit";
      });
    }

  }

  void Ctok() {
    double? cal = double.tryParse(_Controller.text);
    if(cal==null){
      setState(() {
        Output="Input Error !!!";
      });
    }else{
      var ans = C.c_k(cal);
      setState(() {
        Output = "${_Controller.text} Celsius = $ans Kelvin";
      });
    }
  }

  void Ftoc() {
    double? cal = double.tryParse(_Controller.text);
    if(cal==null){
      setState(() {
        Output="Input Error !!!";
      });
    }else{
      var ans = F.f_c(cal);
      setState(() {
        Output = "${_Controller.text} Fahrenheit = $ans Celsius";
      });
    }
  }

  void Ftok() {
    double? cal = double.tryParse(_Controller.text);
    if(cal==null){
      setState(() {
        Output="Input Error !!!";
      });
    }else{
      var ans = F.f_k(cal);
      setState(() {
        Output = "${_Controller.text} Fahrenheit = $ans Kelvin";
      });
    }
  }

  void Ktoc() {
    double? cal = double.tryParse(_Controller.text);
    if(cal==null){
      setState(() {
        Output="Input Error !!!";
      });
    }else{
      var ans = K.k_c(cal);
      setState(() {
        Output = "${_Controller.text} Kelvin = $ans Celsius";
      });
    }

  }

  void Ktof() {
    double? cal = double.tryParse(_Controller.text);
    if(cal==null){
      setState(() {
        Output="Input Error !!!";
      });
    }else{
      var ans = K.k_f(cal);
      setState(() {
        Output = "${_Controller.text} Kelvin = $ans Fahrenheit";
      });
    }
  }
  @override
  void click(int i) {
    if(_Controller.text==""){
      setState(() {
        Output="กรุณากรอกข้อมูล";
      });
      return;
    }
    switch(i){
      case 0: Ctof();break;
      case 1:  Ctok();break;
      case 2: Ftoc();break;
      case 3: Ftok(); break;
      case 4: Ktoc();break;
      case 5:  Ktof();break;
    }
  }

  Widget build(BuildContext context) {
    var mylist = [
      ['ctof', 'ctok'],
      ['ftoc', 'ftok'],
      ['ktoc', 'ktof']
    ];
    int num = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Midterm Exam'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.00),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Temperature Converter',
                    style: GoogleFonts.kanit(fontSize: 40)),
                Container(
                  padding: EdgeInsets.all(16.00),
                  decoration: BoxDecoration(
                    color: Colors.white, //สีพื้นหลังของ Container
                    border: Border.all(
                      width: 5.0,
                      color: Colors.orange,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _Controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a temperature value to convert'),
                      ),
                      for (var i in mylist)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [for (var j in i) addbutton(j, num++)],
                        )
                    ],
                  ),
                ),
                Text(
                  Output,
                  style: GoogleFonts.sarabun(fontSize: 20),
                ),
              ]),
        ),
      ),
    );
  }
}
