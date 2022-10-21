import 'dart:collection';
import 'package:calendartest/pages/solve_quizs/first_page.dart';
import 'package:calendartest/pages/solve_quizs/fourth_page.dart';
import 'package:calendartest/pages/solve_quizs/second_page.dart';
import 'package:calendartest/service/token_service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class ThirdQuiz extends StatefulWidget {
  @override
  _ThirdQuizState createState() => _ThirdQuizState();
}

class _ThirdQuizState extends State<ThirdQuiz> {
  TextEditingController createTextController = TextEditingController();
  Function eq = const ListEquality().equals;
  List<String> answer = ['0', '0', '0'];
  List<String> answer1 = ['1', '3', '2'];
  @override
  Widget build(BuildContext context) {
    return Consumer<TokenService>(
      builder: (context, tokenService, child) {
        List<String> testTokenList = tokenService.testTokenList;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
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
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => FirstQuiz()),
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
                                MaterialPageRoute(builder: (_) => SecondQuiz()),
                              ),
                              icon: Image.asset('assets/circle_purple.png'),
                            ),
                          ),
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
                                MaterialPageRoute(builder: (_) => FourthQuiz()),
                              ),
                              icon: Image.asset('assets/circle_purple.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      '잭 오 랜턴의 눈 속에서\n 발견한 암호는?',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                                    MediaQuery.of(context).size.width * 0.25,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      createTextController.text = "";
                                      return AlertDialog(
                                        title: Text("정답은 무엇일까요?"),
                                        content: TextField(
                                          controller: createTextController,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("취소")),
                                          TextButton(
                                              onPressed: () {
                                                answer[0] =
                                                    createTextController.text;
                                                print('체크$answer[0]');
                                                Navigator.pop(context);
                                              },
                                              child: Text("작성")),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Image.asset('assets/pumpkin.png'),
                              ),
                              IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.25,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      createTextController.text = "";
                                      return AlertDialog(
                                        title: Text("정답은 무엇일까요?"),
                                        content: TextField(
                                          controller: createTextController,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("취소")),
                                          TextButton(
                                              onPressed: () {
                                                answer[1] =
                                                    createTextController.text;
                                                print('체크$answer[1]');
                                                Navigator.pop(context);
                                              },
                                              child: Text("작성")),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Image.asset('assets/pumpkin.png'),
                              ),
                            ],
                          ),
                          IconButton(
                            iconSize: MediaQuery.of(context).size.width * 0.25,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  createTextController.text = "";
                                  return AlertDialog(
                                    title: Text("정답은 무엇일까요?"),
                                    content: TextField(
                                      controller: createTextController,
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("취소")),
                                      TextButton(
                                          onPressed: () {
                                            answer[2] =
                                                createTextController.text;
                                            print('체크$answer[2]');
                                            Navigator.pop(context);
                                          },
                                          child: Text("작성")),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Image.asset('assets/pumpkin.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: IconButton(
                      iconSize: MediaQuery.of(context).size.width * 0.2,
                      onPressed: () {
                        showDialog(
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
                                    if (eq(answer, answer1)) {
                                      tokenService.updateTestToken('2', 2);
                                    } else {
                                      tokenService.updateTestToken('1', 2);
                                    }
                                    print(testTokenList[2]);
                                    Navigator.pop(context);
                                  },
                                  child: Text("맞아요!"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Image.asset('assets/key.png'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (testTokenList[0] == '2') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/potion_red.png'),
                              ),
                            ),
                          ] else if (testTokenList[0] == '1') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/question_mark.png'),
                              ),
                            ),
                          ],
                          if (testTokenList[1] == '2') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/potion_pink.png'),
                              ),
                            ),
                          ] else if (testTokenList[1] == '1') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/question_mark.png'),
                              ),
                            ),
                          ],
                          if (testTokenList[2] == '2') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/potion_orange.png'),
                              ),
                            ),
                          ] else if (testTokenList[2] == '1') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/question_mark.png'),
                              ),
                            ),
                          ],
                          if (testTokenList[3] == '2') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/potion_green.png'),
                              ),
                            ),
                          ] else if (testTokenList[3] == '1') ...[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.12,
                                onPressed: () {},
                                icon: Image.asset('assets/question_mark.png'),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
