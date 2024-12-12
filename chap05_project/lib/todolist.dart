import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  var num = 0;
  var inputText = TextEditingController();
  var inputText2 = TextEditingController();
  List<String> subjects = [];
  List<String> contents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("ToDo 리스트"),
      )),
      body: Expanded(
          child: ListView.builder(
              itemCount: num,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Text((i + 1).toString()),
                  title: Text(subjects[i]),
                  trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          subjects.removeAt(i);
                          contents.removeAt(i);
                          num -= 1;
                        });
                      },
                      child: Text("삭제")),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(subjects[i]),
                            content: Text(contents[i]),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("닫기"))
                            ],
                          );
                        });
                  },
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("일정 등록"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: inputText,
                        decoration: InputDecoration(hintText: "제목을 입력하세요"),
                      ),
                      TextField(
                        controller: inputText2,
                        decoration: InputDecoration(hintText: "상세 내용을 입력하세요"),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          // inputText2.text = "";
                          // inputText.text = "";
                          inputText.clear();
                          inputText2.clear();
                          Navigator.pop(context);
                        },
                        child: Text("취소")),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (inputText.text.isNotEmpty &&
                                inputText.text.isNotEmpty) {
                              num++;
                              subjects.add(inputText.text);
                              contents.add(inputText2.text);

                              Navigator.pop(context);
                            }

                            // inputText2.text = "";
                            // inputText.text = "";
                            inputText.clear();
                            inputText2.clear();
                          });
                        },
                        child: Text("완료")),
                  ],
                );
              });
        },
        child: Text("등록"),
      ),
    );
  }
}
