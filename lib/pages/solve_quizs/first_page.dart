// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'package:calendartest/main.dart';
import 'package:calendartest/pages/quizs_sub_page/all_potion_getted.dart';
import 'package:calendartest/pages/solve_quizs/fourth_page.dart';
import 'package:calendartest/pages/solve_quizs/second_page.dart';
import 'package:calendartest/pages/solve_quizs/third_page.dart';
import 'package:calendartest/service/token_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:collection/collection.dart';

class FirstQuiz extends StatefulWidget {
  @override
  _FirstQuizState createState() => _FirstQuizState();
}

class _FirstQuizState extends State<FirstQuiz> {
  TextEditingController createTextController = TextEditingController();
  Function eq = const ListEquality().equals;
  List<String> answer = ['0', '0', '0', '0'];
  List<String> answer1 = ['1', '3', '2', '4'];
  String event_flag = '0';
  //이후 앱 확장시 필요한 변수 코드
  // List<String> navigatorIcon = [];
  // List<String> contentsIcon = [];
  // List<String> potionIcon = [
  //   'assets/potion_red.png',
  //   'assets/potion_pink.png',
  //   'assets/potion_orange.png',
  //   'assets/potion_green.png',
  // ];
  // List<String> answerList = [];
  // List<String> answer1List = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<TokenService>(
      builder: (context, tokenService, child) {
        List<String> testTokenList = tokenService.testTokenList;
        BuildContext temp_context = context;
        _modalRouter(BuildContext context) async {
          String routeName = await showDialog(
            context: context,
            builder: (context) {
              createTextController.text = "";
              return AlertDialog(
                title: Text("입력하신 정답이 맞나요?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("다시 생각해볼게요."),
                  ),
                  TextButton(
                    onPressed: () {
                      // 정답이 맞을 경우 토큰을 바꿔주는 로직
                      if (eq(answer, answer1)) {
                        tokenService.updateTestToken('2', 0);
                      } else {
                        testTokenList[0] = '1';
                        Navigator.of(context).pop('/WrongAnswer');
                      }
                      // 포션이 하나라도 부족할 경우 retrun
                      for (int j = 0; j <= 3; j++) {
                        if (testTokenList[j] == '1') {
                          Navigator.pop(context);
                          return;
                        }
                      }
                      print("test00");
                      Navigator.of(context).pop('/WinThisGame');
                      print("test01");
                      Navigator.pop(context);
                    },
                    child: Text("맞아요!"),
                  ),
                ],
              );
            },
          );
          Navigator.of(context).pushNamed(routeName);
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: Image.asset('assets/circle_white.png'),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: 30,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SecondQuiz()),
                            ),
                            icon: Image.asset('assets/circle_purple.png'),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: 30,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ThirdQuiz()),
                            ),
                            icon: Image.asset('assets/circle_purple.png'),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: 30,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => FourthQuiz()),
                            ),
                            icon: Image.asset('assets/circle_purple.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 문제 텍스트
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Text(
                    '가격표에 숨겨진\n 암호를 입력해 주세요',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // 정답 입력 아이콘들
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize:
                                      MediaQuery.of(context).size.width * 0.3,
                                  onPressed: () {
                                    //카드 아이콘 눌렀을 시에 뜨는 정답 입력 창
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        createTextController.text = "";
                                        return AlertDialog(
                                          title: Text("파란색 카드의 정답은 무엇일까요?"),
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[0] = '1';
                                                        print(answer[0]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[0] = '2';
                                                        setState(() {});
                                                        print(answer[0]);
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "2",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[0] = '3';
                                                        print(answer[0]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "3",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[0] = '4';
                                                        print(answer[0]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "4",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/suncard_blue.png'),
                                      Text(
                                        answer[0],
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  iconSize:
                                      MediaQuery.of(context).size.width * 0.3,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        createTextController.text = "";
                                        return AlertDialog(
                                          title: Text("회색 카드의 정답은 무엇일까요?"),
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[1] = '1';
                                                        print(answer[1]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[1] = '2';
                                                        setState(() {});
                                                        print(answer[1]);
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "2",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[1] = '3';
                                                        print(answer[1]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "3",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[1] = '4';
                                                        print(answer[1]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "4",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/suncard_gray.png'),
                                      Text(
                                        answer[1],
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    IconButton(
                                      iconSize:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            createTextController.text = "";
                                            return AlertDialog(
                                              title: Text("초록색 카드의 정답은 무엇일까요?"),
                                              content: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          iconSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                          onPressed: () {
                                                            answer[2] = '1';
                                                            print(answer[2]);
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Image.asset(
                                                                  'assets/potion_red.png'),
                                                              Text(
                                                                "1",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        IconButton(
                                                          iconSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                          onPressed: () {
                                                            answer[2] = '2';
                                                            setState(() {});
                                                            print(answer[2]);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Image.asset(
                                                                  'assets/potion_red.png'),
                                                              Text(
                                                                "2",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconButton(
                                                          iconSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                          onPressed: () {
                                                            answer[2] = '3';
                                                            print(answer[2]);
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Image.asset(
                                                                  'assets/potion_red.png'),
                                                              Text(
                                                                "3",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        IconButton(
                                                          iconSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                          onPressed: () {
                                                            answer[2] = '4';
                                                            print(answer[2]);
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Image.asset(
                                                                  'assets/potion_red.png'),
                                                              Text(
                                                                "4",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/suncard_green.png'),
                                          Text(
                                            answer[2],
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  iconSize:
                                      MediaQuery.of(context).size.width * 0.3,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        createTextController.text = "";
                                        return AlertDialog(
                                          title: Text("보라색 카드의 정답은 무엇일까요?"),
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[3] = '1';
                                                        print(answer[3]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[3] = '2';
                                                        setState(() {});
                                                        print(answer[3]);
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "2",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[3] = '3';
                                                        print(answer[3]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "3",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      onPressed: () {
                                                        answer[3] = '4';
                                                        print(answer[3]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/potion_red.png'),
                                                          Text(
                                                            "4",
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset('assets/suncard_purple.png'),
                                      Text(
                                        answer[3],
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (event_flag == '1') ...[]
                  ],
                ),
                // 열쇠 누를 시 발생하는 이벤트
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: IconButton(
                    iconSize: MediaQuery.of(context).size.width * 0.2,
                    onPressed: () {
                      _modalRouter(context);
                    },
                    icon: Image.asset('assets/key.png'),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (testTokenList[0] == '2') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/potion_red.png'),
                          ),
                        ),
                      ] else if (testTokenList[0] == '1') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/question_mark.png'),
                          ),
                        ),
                      ],
                      if (testTokenList[1] == '2') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/potion_pink.png'),
                          ),
                        ),
                      ] else if (testTokenList[1] == '1') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/question_mark.png'),
                          ),
                        ),
                      ],
                      if (testTokenList[2] == '2') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/potion_orange.png'),
                          ),
                        ),
                      ] else if (testTokenList[2] == '1') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/question_mark.png'),
                          ),
                        ),
                      ],
                      if (testTokenList[3] == '2') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/potion_green.png'),
                          ),
                        ),
                      ] else if (testTokenList[3] == '1') ...[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.12,
                            onPressed: () {},
                            icon: Image.asset('assets/question_mark.png'),
                          ),
                        ),
                      ],
                    ],
                  ),
                  //추후 앱 확장시 사용할 코드
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: potionIcon.length,
                  //   itemBuilder: (context, index) {
                  //     return Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         if (testTokenList[index] == '2') ...{
                  //           Container(
                  //             width:
                  //                 MediaQuery.of(context).size.width * 0.20,
                  //             child: IconButton(
                  //               iconSize: 30,
                  //               onPressed: () {},
                  //               icon: Image.asset(potionIcon[index]),
                  //             ),
                  //           )
                  //         } else if (testTokenList[index] == '1') ...{
                  //           Container(
                  //             width:
                  //                 MediaQuery.of(context).size.width * 0.20,
                  //             child: IconButton(
                  //               iconSize: 30,
                  //               onPressed: () {},
                  //               icon:
                  //                   Image.asset('assets/question_mark.png'),
                  //             ),
                  //           ),
                  //         },
                  //       ],
                  //     );
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
