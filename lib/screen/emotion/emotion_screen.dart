import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../shared/colors.dart';

class Emotion extends StatefulWidget {
  @override
  State<Emotion> createState() => _EmotionState();
}

class _EmotionState extends State<Emotion> {

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
                '분석 결과',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: BLACK_COLOR,
                    fontSize: 25.0),
              ),
              SizedBox(height: 10.0), // 여백
              Text(
                ' 분석 결과, 88%의 행복, 75%의 신남, 53%의 기대 상태가 분석되었어요.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR,
                    fontSize: 15.0),
              ),
              SizedBox(height: 10.0), // 여백

              Text(
                '- 엎드린다 (플레이 바우 자세)\n'
                    ' 강아지가 신나서 보호자 혹은 다른 강아지와 함께 놀고 싶을 때, '
                    '플레이 바우(Play bow)라고 불리는 엎드린 자세를 해요. 마치 기지개를 켜는 듯한 자세인데요. 가슴은 바닥으로 낮추며 팔을 쪽 뻗고, 엉덩이는 높이 드는 자세입니다.'
                    '이때, 헥헥거리기, 꼬리 흔들기, 으르렁거리기, 낑낑거리기 등의 행동을 보이기도 합니다.\n\n'
                    '- 짧게 재채기를 한다\n'
                    ' 강아지가 재채기를 하는 건 코가 간지럽거나 자극적인 냄새를 맡았을 때만이 아니에요. '
                    '사람과 달리 강아지는 감정을 표현하기 위해 재채기를 하기도 합니다. '
                    '강아지는 너무 신났을 때에도 재채기를 하는데요. '
                    '다른 강아지와 놀 때, 보호자가 집에 돌아왔을 때 등이 상황에서 하는 경우가 많습니다. '
                    '참고로, 이때의 재채기는 깊은 숨이 터져 나오는 재채기가 아닌 콧김을 내뿜는 듯 짧게 킁킁거리는 듯한 재채기랍니다.',
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
