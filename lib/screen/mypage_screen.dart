import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../shared/colors.dart';
import 'package:image_picker/image_picker.dart';

class Mypage extends StatefulWidget {
  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  XFile? _image; // 이미지 담을 변수
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 상단바
              Row(
                children: [
                  BackButton(),
                  Spacer(),
                ],
              ),
              Text(
                '마이페이지',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: BLACK_COLOR,
                    fontSize: 25.0),
              ),
              SizedBox(height: 20.0),

              // 프로필 사진
              GestureDetector(
                  onTap: (){
                    _showBottomSheet();
                  },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: (_image != null)
                      ? Image.file(
                          File(_image!.path),
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(height: 20.0),

              // 닉네임
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  '닉네임',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              Spacer(),

              // 임시 버튼
              _SettingButton(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _SettingButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '로그아웃',
        style: TextStyle(
            fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20.0),
      ),
    );
  }

  IconButton MyPageButton() {
    return IconButton(
      icon: Icon(
        Icons.account_circle,
        color: PRIMARY_COLOR,
        size: 100.0,
      ),
      onPressed: () {
        _showBottomSheet();
      },
    );
  }

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

  // 사진 등록 모달창(하단)
  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.all(
              Radius.circular(15), // 모달 전체 라운딩 처리
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  getImage(
                      ImageSource.camera); //getImage 함수를 호출해서 카메라로 찍은 사진 가져오기
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  minimumSize: const Size.fromHeight(50),
                  elevation: 0,
                ),
                child: const Text(
                  '사진 찍기',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15.0),
                ),
              ),
              const Divider(
                thickness: 3,
                color: Colors.white,
              ),
              ElevatedButton(
                onPressed: () {
                  getImage(
                      ImageSource.gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  minimumSize: const Size.fromHeight(50),
                  elevation: 0,
                ),
                child: const Text(
                  '갤러리에서 불러오기',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
