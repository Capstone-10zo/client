import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../shared/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Pedia2 extends StatefulWidget {
  @override
  State<Pedia2> createState() => _Pedia2State();
}

class _Pedia2State extends State<Pedia2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단바
              Row(
                children: [
                  BackButton(),
                  Spacer(),
                ],
              ),
              Text(
                '결막염',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: BLACK_COLOR,
                    fontSize: 25.0),
              ),
              SizedBox(height: 10.0), // 여백
              SizedBox(height: 10.0), // 여백
              Text(
                '결막염은 안구와 안검을 결합하는 점막 조직에 염증이 발생하는 질환입니다.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR,
                    fontSize: 15.0),
              ),
              Container(
                child: Image.asset('lib/assets/images/eyes.png'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              SizedBox(height: 10.0), // 여백
              Text(
                    '결막염은 세균, 바이러스, 기생충 등에 의한 감염, 환경적인 요인에 의한 알러지 반응, ',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR,
                    fontSize: 15.0),
              ),
              //_BoneButton(),
            ],
          ),
        ),
      ),
    );
  }

  // 뒤로가기 버튼
  IconButton BackButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: PRIMARY_COLOR,
        size: 40.0,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
