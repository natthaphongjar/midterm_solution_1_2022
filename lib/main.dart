import 'package:flutter/material.dart';
import 'package:midterm_solution_1_2022/pages/home/home_page.dart';
import 'package:midterm_solution_1_2022/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const Login_page(),
    );
  }
}



