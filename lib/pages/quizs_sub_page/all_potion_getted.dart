import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class WinThisGame extends StatefulWidget {
  const WinThisGame({Key? key}) : super(key: key);

  @override
  State<WinThisGame> createState() => _WinThisGameState();
}

class _WinThisGameState extends State<WinThisGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset(
            'assets/mix_potion.jpg',
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => WinThisGame2()),
        ),
      ),
    );
  }
}

class WinThisGame2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset(
            'assets/witch_page1.jpg',
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
          ),
        ),
        onTap: () => MaterialPageRoute(builder: (_) => WinThisGame3()),
      ),
    );
  }
}

class WinThisGame3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset(
            'assets/answer_wrong.jpg',
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
          ),
        ),
        onTap: () => MaterialPageRoute(builder: (_) => WinThisGame4()),
      ),
    );
  }
}

class WinThisGame4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset(
            'assets/answer_wrong.jpg',
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
          ),
        ),
        onTap: () => MaterialPageRoute(builder: (_) => WinThisGame5()),
      ),
    );
  }
}

class WinThisGame5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset(
            'assets/answer_wrong.jpg',
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
          ),
        ),
        onTap: () => MaterialPageRoute(builder: (_) => WinThisGame5()),
      ),
    );
  }
}

class WinThisGame1 extends StatefulWidget {
  const WinThisGame1({Key? key}) : super(key: key);

  @override
  State<WinThisGame1> createState() => _WinThisGameState1();
}

class _WinThisGameState1 extends State<WinThisGame1>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    FlutterGifController controller = FlutterGifController(
      vsync: this,
    );
    controller.animateTo(
      18,
      duration: Duration(milliseconds: 1000),
    );

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: GifImage(
            controller: controller,
            image: const AssetImage(
              'assets/boom.gif',
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
          ),
        ),
        onTap: () => MaterialPageRoute(builder: (_) => WinThisGame2()),
      ),
    );
  }
}
