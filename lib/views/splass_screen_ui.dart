//splass_screen_ui.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diaryfood_app/utils/gradient_text.dart';
import 'package:my_diaryfood_app/views/home_ui.dart';

class SplassScreenUI extends StatefulWidget {
  const SplassScreenUI({super.key});

  @override
  State<SplassScreenUI> createState() => _SplassScreenUIState();
}

class _SplassScreenUIState extends State<SplassScreenUI> {
  
  @override
  void initState() {
    // TODO: implement initState
    //คำสั่งในการหน่วงเวลาเพื่อเปิดไปยังหน้า HomeUI
    Future.delayed(
      //ระยะเวลาที่หน่วง
      Duration(
        seconds: 3,
      ),
      //พอครบกำหนดจะให้เปิดหน้าจอที่เลือก
      ()=> Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeUI(),),
      ),
    );

    super.initState();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.bowlFood,
                  size: MediaQuery.of(context).size.width * 0.35,
                  color: Colors.amber,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'My Diary Food',
                  style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text(
                  'บันทึกการกิน V.1.0',
                  style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GradientText(
                  'Created by  DIT-SAU',
                  style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.red,
                      Colors.purple,
                      Colors.amber,
                      Colors.pink,
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
