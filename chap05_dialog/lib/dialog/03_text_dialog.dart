import 'package:flutter/material.dart';

class DialogTest4 extends StatelessWidget {
  const DialogTest4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("텍스트 입력"),
                      content: TextField(
                        // 클릭했을 때
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "내용", // label 역할
                            hintText: "내용을 입력하세요", // placeholder 역할
                            helperText: "도움되는 텍스트"),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("취소")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("완료")),
                      ],
                    );
                  });
            },
            child: Text(
              "버튼",
              style: TextStyle(fontSize: 30),
            )));
  }
}
