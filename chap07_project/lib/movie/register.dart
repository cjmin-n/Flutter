import 'package:flutter/material.dart';

class RegisterMovie extends StatefulWidget {
  final List<Map<String, String>> movieList;
  final Function(int) onItemTapped;

  const RegisterMovie(
      {super.key, required this.movieList, required this.onItemTapped});

  @override
  State<RegisterMovie> createState() => _RegisterMovieState();
}

class _RegisterMovieState extends State<RegisterMovie> {
  var input1 = TextEditingController();
  var input2 = TextEditingController();
  var input3 = TextEditingController();

  late List<Map<String, String>> _movieList;
  late Function(int) _onItemTapped;
  @override
  void initState() {
    _movieList = widget.movieList;
    _onItemTapped = widget.onItemTapped;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "영화제목"),
            controller: input1,
          ),
          TextField(
            decoration: InputDecoration(labelText: "감독"),
            controller: input2,
          ),
          TextField(
            decoration: InputDecoration(labelText: "내용"),
            controller: input3,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                _movieList.add({
                  "title": input1.text,
                  "director": input2.text,
                  "contents": input3.text
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("영화 등록"),
                      content: Text("정말 등록하시겠습니까?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("취소")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _onItemTapped(0);
                            },
                            child: Text("등록")),
                      ],
                    );
                  },
                );
              },
              child: Text("영화 등록")),
        ],
      ),
    );
  }
}
