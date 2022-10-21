// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:calendartest/pages/create_quizs/password_quiz.dart';
import 'package:calendartest/pages/create_quizs/simple_quiz.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectQuizForm extends StatefulWidget {
  @override
  _SelectQuizFormState createState() => _SelectQuizFormState();
}

class _SelectQuizFormState extends State<SelectQuizForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            // ElevatedButton(
            //   child: Text('로그인 화면'),
            //   onPressed: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (_) => TableBasicsExample()),
            //   ),
            // ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Simple Quiz'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SimpleQuiz()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Password Quiz'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PasswordQuiz()),
              ),
            ),
            const SizedBox(height: 12.0),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
