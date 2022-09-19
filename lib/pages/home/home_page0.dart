import 'package:flutter/material.dart';
import 'package:midterm_solution_1_2022/pages/home/home_page.dart';


class home_page0 extends StatefulWidget {
  const home_page0({Key? key}) : super(key: key);

  @override
  State<home_page0> createState() => _home_page0State();
}

class _home_page0State extends State<home_page0> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('HOME'),
        titleTextStyle: TextStyle(fontSize: 40, color: Colors.white),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()))
                    },
                child: Text('ตรวจอุณหภูมิ')),
          ],
        ),
      ),
    );
  }
}
