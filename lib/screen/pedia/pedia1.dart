import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../shared/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Pedia1 extends StatefulWidget {
  @override
  State<Pedia1> createState() => _Pedia1State();
}

class _Pedia1State extends State<Pedia1> {

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
                '백내장',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: BLACK_COLOR,
                    fontSize: 25.0),
              ),
              SizedBox(height: 10.0), // 여백
              Text(
                '백내장은 눈의 수정체가 흐려지거나 불투명해져 시력에 장애를 주는 질환입니다.\n',
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
              Text(
                '\n백내장은 시력 장애,시력 상실까지 일으킬 수 있습니다.\n\n먼저, 수술은 강아지 백내장에 가장 효과적인 치료 방법입니다. '
                    '흐려진 수정체를 제거하고 인공 수정체로 교체하는 방식으로 진행되며, '
                    '대부분의 강아지들은 이 과정을 통해 눈 건강이 회복되어 시력을 되찾을 수 있습니다.\n\n'
                    '또한 비타민 E, C와 같은 항산화 영양제가 백내장의 진행을 늦추는 데 도움이 될 수 있습니다.',
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
