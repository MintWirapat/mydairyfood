import 'dart:convert';

import 'package:my_diaryfood_app/models/diaryfood.dart';
import 'package:http/http.dart' as http;

class CallApi {
  //metod เรียกใช้ api : getall
  static Future<List<Diaryfood>> callAPIGetAllDiaryfood() async {
    //เรียกฝฃ้ api
    final response = await http.get(
      Uri.parse('http://192.168.56.1/diaryfoodapi/getall'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      //เอาข้อมูลที่ส่งกลับมาเป็นjson แปลงเป็นข้อมูลที่จะนำมาใช้ในแอปฯ เก็บในตัวแปร
      final responseData = jsonDecode(response.body);

      //แปลงข้อมูลให้เป็นlist และเก็บในตัวแปร list
      final diaryfoodDataList = await responseData.map<Diaryfood>((json) {
        return Diaryfood.fromJson(json);
      }).toList();

      //ส่งข้อมูลที่เก็บในตัวแปร list กลับไป ณ จุดที่เรียกใช้ metod เพื่อนำช้อมูลไปใช้งาน
      return diaryfoodDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //metod เรียกใช้ api : insert
  static Future<String> callAPIInsertDiaryfood(Diaryfood diaryfood) async {
    final response = await http.post(
      Uri.parse('http://192.168.56.1/diaryfoodapi/insert'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    }else{
      throw Exception('Failed to fetch data');
    }
  }

  //metod เรียกใช้ api : update
  static Future<String> callAPIUpdateDiaryfood(Diaryfood diaryfood) async{
    final response = await http.post(
      Uri.parse('http://192.168.56.1/diaryfoodapi/update'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    }else{
      throw Exception('Failed to fetch data');
    }
  }

  //metod เรียกใช้ api : delete
  static Future<String> callAPIDeleteDiaryfood(Diaryfood diaryfood) async{
    final response = await http.post(
      Uri.parse('http://192.168.56.1/diaryfoodapi/delete'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    }else{
      throw Exception('Failed to fetch data');
    }
  }
}
