import 'package:flutter/material.dart';

import 'movie/list.dart';
import 'movie/register.dart';
import 'movie/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MypageState();
}

class _MypageState extends State<MyPage> {
  int _selectedIndex = 0;

  List<Map<String, String>> movieList = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getContents() {
    switch (_selectedIndex) {
      case 0:
        return movieList.isEmpty
            ? Center(child: Text("등록된 영화가 없습니다."))
            : ListMovie(movieList: movieList);
      case 1:
        return RegisterMovie(
          movieList: movieList,
          onItemTapped: _onItemTapped,
        );
      case 2:
        return SearchMovie(
          movieList: movieList,
        );
      default:
        return Text("페이지가 없습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화관리 앱"),
      ),
      body: _getContents(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              label: "영화 목록",
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              label: "영화 추가",
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: "영화 검색",
              icon: Icon(Icons.search),
            ),
          ]),
    );
    ;
  }
}
