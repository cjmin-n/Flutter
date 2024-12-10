import 'package:flutter/material.dart';

/*class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Layout-test"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)), // 자식 크기에 따라 크기 적용
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.fromLTRB(10, 20, 30, 40), // 마진, 패딩은 컨테이너만 가능 / Row, Column 에는 불가능하다.
        child: Text("컨테이너 텍스트"),
      )
    );
  }
}*/

/*
* 직접 포지션을 지정해서 위젯을 움직이는 방법은
* 보통 Positioned 위젯과 같은 방법으로 이루어 지지만,
* 플러터에서는 일반적으로 위젯의 위치를 직접 설정하기 보다는
* 레이아웃 위젯(ex ) Column, Row, Center 등) 을 사용하여
* 자동으로 배치되는 방식을 권장한다.
* */
class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Layout-test"),
        ),
      ),

      body: /*Row( // Column 안에 Row 쓰기
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(30),
            child: Text("컨테이너 1번"),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(30),
            child: Text("컨테이너 2번"),
          ),
        ],
      ),*/
      Align( // 바디 안에서 정렬
        alignment: Alignment.topCenter,
        child: Container(width: 50, height: 50, color: Colors.blue,),
      ),
    );
  }
}

