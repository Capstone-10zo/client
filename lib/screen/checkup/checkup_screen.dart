import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawsitive/screen/loading_screen.dart';
import '../../shared/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


import '../emotion/emotion_screen.dart';

class Checkup extends StatefulWidget {
  @override
  State<Checkup> createState() => _CheckupState();
}

class _CheckupState extends State<Checkup> {
  XFile? _image; // 이미지 담을 변수
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      // setState(() {
      //   _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      // });
      File file = File(pickedFile.path);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Loading(file: file)));
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
                '사진으로 건강검진 하기',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: BLACK_COLOR,
                    fontSize: 25.0),
              ),
              SizedBox(height: 10.0), // 여백
              Text(
                '걱정되는 부위의 사진을 올려주세요 📸',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR,
                    fontSize: 15.0),
              ),
              SizedBox(height: 20.0), // 여백
              // 안구
              _EyesButton(),
              SizedBox(height: 20.0),

              // 피부
              _SkinButton(),

              SizedBox(height: 20.0),
              // 슬개골
              _BoneButton(),
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

  // 안구 버튼
  ElevatedButton _EyesButton() {
    return ElevatedButton(
      onPressed: () {
        _showBottomSheet();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.height - 250) / 3), // Set this
        backgroundColor: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '안구',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700, color: BACK_COLOR, fontSize: 25.0),
      ),
    );
  }

  // 피부 버튼
  ElevatedButton _SkinButton(){
    return ElevatedButton(
      onPressed: () {
        _showBottomSheet();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.height - 250) / 3), // Set this
        backgroundColor: BEIGE_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '피부',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700, color: GREY_COLOR, fontSize: 25.0),
      ),
    );
  }

  // 슬개골 버튼
  ElevatedButton _BoneButton(){
    return ElevatedButton(
      onPressed: () {
        _showBottomSheet();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.height - 250) / 3), // Set this
        backgroundColor: YELLOW_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '슬개골',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700, color: GREY_COLOR, fontSize: 25.0),
      ),
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
                  getImage(ImageSource.camera); //getImage 함수를 호출해서 카메라로 찍은 사진 가져오기
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
                  getImage(ImageSource.gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
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