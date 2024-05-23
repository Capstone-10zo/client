import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawsitive/screen/pedia/pedia1.dart';
import '../../shared/colors.dart';

class Pedia extends StatefulWidget {
  @override
  State<Pedia> createState() => _PediaState();
}

class _PediaState extends State<Pedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // 상단바
              Row(
                children: [
                  BackButton(),
                  Spacer(),
                ],
              ),
              Text(
                '질병 백과',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: BLACK_COLOR,
                    fontSize: 25.0),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.0), // 여백

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // 백내장
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '백내장',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                
                          SizedBox(width: 20.0), // 여백
                
                          // 결막염
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '결막염',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: PRIMARY_COLOR,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      SizedBox(height: 20.0), // 여백
                
                      // 둘째 줄
                      Row(
                        children: [
                          // 백내장
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: BEIGE_COLOR,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '백내장',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: GREY_COLOR,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                
                          SizedBox(width: 20.0), // 여백
                
                          // 결막염
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: YELLOW_COLOR,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '결막염',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: GREY_COLOR,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      SizedBox(height: 20.0), // 여백
                
                      // 셋째줄
                      Row(
                        children: [
                          // 백내장
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '백내장',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                
                          SizedBox(width: 20.0), // 여백
                
                          // 결막염
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '결막염',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      SizedBox(height: 20.0), // 여백
                
                      // 넷째 줄
                      Row(
                        children: [
                          // 백내장
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '백내장',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                
                          SizedBox(width: 20.0), // 여백
                
                          // 결막염
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '결막염',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      SizedBox(height: 20.0), // 여백
                
                      // 다섯째 줄
                      Row(
                        children: [
                          // 백내장
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '백내장',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                
                          SizedBox(width: 20.0), // 여백
                
                          // 결막염
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '결막염',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0), // 여백

                      Row(
                        children: [
                          // 백내장
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '백내장',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                
                          SizedBox(width: 20.0), // 여백
                
                          // 결막염
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => Pedia1()));
                            },
                            child: Container(
                              height: 100,
                              width: (MediaQuery.of(context).size.width - 60)/2,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR,
                                border: Border.all(color: PRIMARY_COLOR, width: 1),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0), // 여백
                                  Container(
                                    width: (MediaQuery.of(context).size.width - 60)/2 - 32,
                                    child: Text(
                                      '결막염',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
