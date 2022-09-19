import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_solution_1_2022/helper.dart';

import '../home/home_page.dart';
import '../home/home_page0.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  var _input = "";
  var ans = "";
  var passworld ="123456";

  @override
  Widget add(bool on) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF00CC33), width: 1.0),
            color: on ? Color(0xFF00CC33) : Colors.transparent),
      ),
    );
  }

  void check(String input) {
    input == "630710"||input==passworld
        ? Navigator.push(
            context, MaterialPageRoute(builder: (context) => home_page0()))
        : setState(() {
           showMyDialog(context, "Sorry", "Incorrect PIN. Please try again");
          });
  }

  Widget _number(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          i==-1?delete():
          setState(() {
            _input = '$_input$i';
          });
          if (_input.length >= 6) {
            check(_input);
            _input = "";
          }
        },
        customBorder: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: i==-1?null:Border.all(color: Color(0xFF00CC33), width: 1.0),
          ),
          child: i==-1?Icon(Icons.backspace_outlined):Text(
            '$i',
            style: GoogleFonts.firaCode(
                fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void delete() {
    setState(() {
      _input = _input.substring(0, _input.length - 1);
    });
  }

  Widget build(BuildContext context) {
    var mylist = [1, 2, 3, 4];
    var mylist2 = [...mylist, 5, 6];

    var a = [
      _number(1),
      _number(2),
      _number(3),
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 128.0,
          ),
          Image.asset("assets/k.png", width: 120),
          SizedBox(
            height: 16.0,
          ),
          Text('Please Enter Your PIN'),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0;i<_input.length;i++)
                  add(true),
              for (var i = _input.length;i<6;i++)
                  add(false),

              /*
              add(_input.length >= 1),
              add(_input.length >= 2),
              add(_input.length >= 3),
              add(_input.length >= 4),
              add(_input.length >= 5),
              add(_input.length >= 6),*/
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          for (var i in [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],[]
          ])
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [for (var j in i) _number(j)]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 84,
              height: 84,
            ),
            _number(0),
            _number(-1)

          ]),
          Text(ans)
        ],
      ),
    );
  }
}
