import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../shared/colors.dart';

class Checkup extends StatefulWidget {
  @override
  State<Checkup> createState() => _CheckupState();
}

class _CheckupState extends State<Checkup> {
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

// 안구 버튼
class _EyesButton extends StatelessWidget {
  const _EyesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
            MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.height - 250) /
                3), // Set this
        backgroundColor: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '안구',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: BACK_COLOR,
            fontSize: 25.0),
      ),
    );
  }
}

// 피부 버튼
class _SkinButton extends StatelessWidget {
  const _SkinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
            MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.height - 250) /
                3), // Set this
        backgroundColor: BEIGE_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '피부',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: GREY_COLOR,
            fontSize: 25.0),
      ),
    );
  }
}

// 슬개골 버튼
class _BoneButton extends StatelessWidget {
  const _BoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
            MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.height - 250) /
                3), // Set this
        backgroundColor: YELLOW_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '슬개골',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: GREY_COLOR,
            fontSize: 25.0),
      ),
    );
  }
}
