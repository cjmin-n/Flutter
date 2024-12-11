import 'package:flutter/material.dart';

class StatelessTest extends StatelessWidget {
  StatelessTest({super.key});
  var a = 1; // 변수 넣으면 const 빼기

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(a.toString()),
      onPressed: (){
        print(a);
        a++; // a는 증가하고 있지만 stateless 여서 반영되고 있지 않다.
      },
    );
  }
}
