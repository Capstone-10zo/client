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
              ),
              SizedBox(height: 20.0), // 여백

              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Pedia1()));
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: PRIMARY_COLOR, width: 1),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.3,
                            blurRadius: 10.0,
                            offset: Offset(0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10.0), // 여백
                          Text(
                            '백내장',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: BLACK_COLOR,
                                fontSize: 20.0),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 10.0), // 여백

                          Text(
                            '백내장은 눈의 수정체가 흐려... ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: BLACK_COLOR,
                                fontSize: 20.0),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0), // 여백

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Pedia1()));
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: PRIMARY_COLOR, width: 1),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.3,
                            blurRadius: 10.0,
                            offset: Offset(0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10.0), // 여백
                          Text(
                            '백내장',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: BLACK_COLOR,
                                fontSize: 20.0),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 10.0), // 여백

                          Text(
                            '백내장은 눈의 수정체가 흐려... ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: BLACK_COLOR,
                                fontSize: 20.0),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Pedia1()));
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: PRIMARY_COLOR, width: 1),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.3,
                            blurRadius: 10.0,
                            offset: Offset(0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10.0), // 여백
                          Text(
                            '백내장',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: BLACK_COLOR,
                                fontSize: 20.0),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 10.0), // 여백

                          Text(
                            '백내장은 눈의 수정체가 흐려... ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: BLACK_COLOR,
                                fontSize: 20.0),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ],
                      ),
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
