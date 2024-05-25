import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawsitive/screen/checkup/checkup_result.dart';
import '../shared/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';



class Loading extends StatefulWidget {
  // const Loading({super.key});
  final File file;

  Loading({required this.file});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState(){
    super.initState();
    navigateToResult();
  }

  bool isLoading = false;

  void navigateToResult() async {
    setState(() {
      isLoading = true;
    });

    // var uri = Uri.parse('http://172.30.1.88:8080/api2');
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://172.30.1.88:8080/api2'));
    request.files.add(
        await http.MultipartFile.fromPath(
          'file', widget.file.path,
          contentType: MediaType('image', 'jpeg'),
        ));

    var response = await request.send();
    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      print('업로드 성공!');
      var responseData = await response.stream.bytesToString();
      var decodedData = jsonDecode(responseData);

      Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => CheckupResult(data: decodedData))
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: BACK_COLOR,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SpinKitRing(
                    color: PRIMARY_COLOR, // 색상 설정
                    size: 80.0, // 크기 설정
                    duration: Duration(seconds: 4),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    // 안내
                    '건강 검진 중입니다.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: BLACK_COLOR,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton backButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: PRIMARY_COLOR,
        size: 35.0,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
