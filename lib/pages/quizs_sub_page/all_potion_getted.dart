import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class WinThisGame extends StatefulWidget {
  const WinThisGame({Key? key}) : super(key: key);

  @override
  State<WinThisGame> createState() => _WinThisGameState();
}

class _WinThisGameState extends State<WinThisGame>
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
      body: Center(
        child: GifImage(
          controller: controller,
          image: const AssetImage(
            'assets/boom.gif',
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
        ),
        // child: Image.asset(
        //   'assets/boom.gif',
        //   width: MediaQuery.of(context).size.width * 1,
        //   height: MediaQuery.of(context).size.height * 1,
        // ),
      ),
    );
  }
}
