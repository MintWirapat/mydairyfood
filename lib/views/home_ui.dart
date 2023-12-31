// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diaryfood_app/models/diaryfood.dart';
import 'package:my_diaryfood_app/services/call_api.dart';
import 'package:my_diaryfood_app/views/add_diaryfood_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //สร้างตัวแปรเก้บข้อมูลที่ได้จากการเรียกใช้ api
  Future<List<Diaryfood>>? diaryfoodData;

  //สร้าง metod ที่เรียกใช้ metod เรียกใช้ api 
  getAllDiaryfood(){
    setState(() {
      diaryfoodData = CallApi.callAPIGetAllDiaryfood();
    });
  }

  @override
  void initState(){
    getAllDiaryfood();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('My Diary Food',
        style: GoogleFonts.kanit(),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //เปิดไปหน้า add diaryfoodUI แบบย้อนกลับได้
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDiaryfoodUI(),
              ),
              );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: [
            //แสดงรูปที่เตรียมไว้
            Image.asset(
              'assets/images/banner.jpg',
              fit: BoxFit.cover,
            ),

            //แสดงข้อมูลรายการกินที่ get มาจากDB เซิร์ฟเวอร์ ในรูปของ listview
            Expanded(
              child: FutureBuilder(
                future: CallApi.callAPIGetAllDiaryfood(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                      // เอาข้อมูลใส่ ListView โดยการตรวจสอบ message
                      if(snapshot.data[0].message == '0'){
                        return Center(
                          child: Text(
                            'ยังไม่มีข้อมูล',
                            style: GoogleFonts.kanit(),
                          ),
                        );
                      }else{
                        return ListView.builder(
                          //นับจำนวนข้อมูลที่จะแสดงใน listview
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              title: Text(
                                snapshot.data[index].foodShopname,
                              ),
                            );
                          },
                        );
                      }
                  }else if (snapshot.hasError){
                    return  Center(
                          child: Text(
                            'มีข้อผิดพลาดเกิดขึ้น',
                            style: GoogleFonts.kanit(),
                          ),
                        );
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
