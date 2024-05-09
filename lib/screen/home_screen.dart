import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawsitive/screen/alert.dart';
import 'package:pawsitive/screen/chatbot/chatbot_screen.dart';
import 'package:pawsitive/screen/emotion/emotion_screen.dart';
import 'package:pawsitive/screen/mypage_screen.dart';
import 'package:pawsitive/screen/pedia/pedia_screen.dart';
import '../shared/colors.dart';
import 'checkup/checkup_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Emotion()));
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
                  MyPageButton(),
                  Spacer(),
                  AlertButton(),
                ],
              ),
              SizedBox(height: 20.0), // 여백
              // 건강검진 버튼
              _CheckupButton(),
              SizedBox(height: 20.0), // 여백
              Expanded(
                child: Row(
                  children: [
                    //감정 상태 분석
                    _EmotionButton(),
                    SizedBox(width: 20.0), // 여백
                    //AI 수의사 상담받기
                    _ChatbotButton()
                  ],
                ),
              ),
              SizedBox(height: 20.0), // 여백
              // 예방접종
              _PediaButton(),
              SizedBox(height: 10.0), // 여백
              // 메모하기
              _TextButton2(),
            ],
          ),
        ),
      ),
    );
  }

  // 마이페이지 버튼
  IconButton MyPageButton() {
    return IconButton(
      icon: Icon(
        Icons.account_circle,
        color: PRIMARY_COLOR,
        size: 40.0,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Mypage()));
      },
    );
  }

  // 알림 버튼
  IconButton AlertButton() {
    return IconButton(
      icon: Icon(
        Icons.circle_notifications,
        color: PRIMARY_COLOR,
        size: 40.0,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Alert()));
      },
    );
  }

  // 감정 상태 분석 버튼
  ElevatedButton _EmotionButton(){
    return ElevatedButton(
      onPressed: () {
        _showBottomSheet();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
            (MediaQuery.of(context).size.width - 60) / 2,
            (MediaQuery.of(context).size.height - 220) /
                2), // Set this
        backgroundColor: BEIGE_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '감정 상태\n분석',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: GREY_COLOR,
            fontSize: 20.0),
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

// 건강검진 버튼
class _CheckupButton extends StatelessWidget {
  const _CheckupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Checkup()));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
            MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.height - 220) /
                2), // Set this
        backgroundColor: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        '사진으로 건강검진 하기',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: BACK_COLOR,
            fontSize: 25.0),
      ),
    );
  }
}

// AI 수의사 버튼
class _ChatbotButton extends StatelessWidget {
  const _ChatbotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Chatbot()));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
            (MediaQuery.of(context).size.width - 60) / 2,
            (MediaQuery.of(context).size.height - 220) /
                2), // Set this
        backgroundColor: YELLOW_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text(
        'AI 수의사\n상담받기',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: GREY_COLOR,
            fontSize: 20.0),
      ),
    );
  }
}

// 질병 백과
class _PediaButton extends StatelessWidget {
  const _PediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Pedia()));
      },
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(
        Icons.local_hospital,
        size: 40.0,
        color: BLACK_COLOR,
      ),
      label: Text(
        '질병 백과',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: BLACK_COLOR,
            fontSize: 20.0),
      ),


    );
  }
}

// 메모하기 버튼(임시)
class _TextButton2 extends StatelessWidget {
  const _TextButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        print('TextButton Button');
      },
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(
        Icons.edit,
        size: 40.0,
        color: BLACK_COLOR,
      ),
      label: Text(
        '검진 내용 메모하기',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: BLACK_COLOR,
            fontSize: 20.0),
      ),
    );
  }
}
