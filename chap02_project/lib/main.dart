import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Practice(),
    );
  }
}

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("실습 앱", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: (){print("검색 아이콘 클릭");}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){print("메시지 아이콘 클릭");}, icon: Icon(Icons.message_outlined)),
          IconButton(onPressed: (){print("설정 아이콘 클릭");}, icon: Icon(Icons.settings)),
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Image.asset("assets/zzang-gu.png", width: 120),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("흰둥이"),
                      Text("비숑"),
                      Text("서울시 구로구"),
                      Row(
                        children: [
                          IconButton(onPressed: (){print("좋아요 추가");}, icon: Icon(Icons.favorite)),
                          Text("4"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            // height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Image.asset("assets/zzang-gu.png", width: 120),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("흰둥이"),
                      Text("비숑"),
                      Text("서울시 구로구"),
                      Row(
                        children: [
                          IconButton(onPressed: (){print("좋아요 추가");}, icon: Icon(Icons.favorite)),
                          Text("4"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){print("홈아이콘 클릭");}, icon: Icon(Icons.home), color: Colors.white,),
            IconButton(onPressed: (){print("검색아이콘 클릭");}, icon: Icon(Icons.search), color: Colors.white,),
            IconButton(onPressed: (){print("알림아이콘 클릭");}, icon: Icon(Icons.notifications), color: Colors.white,),
            IconButton(onPressed: (){print("유저아이콘 클릭");}, icon: Icon(Icons.account_circle), color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
