import 'package:flutter/material.dart';

/*
* 네비게이터 (Navigator)
* - 플러터에서 화면 전환을 관리하는 위젯이다.
* - 스택 구조를 사용하여 화면을 위에 쌓거나, 아래로 제거함으로써
* 유저가 여러 화면 사이를 탐색할 수 있게 도와준다.
* - push - 새로운 화면을 스택 위에 추가
* - pop - 스택에서 현재 화면 제거
*
* -> 뒤로가기 가능
* 위젯이 바뀌는건 뒤로가기 불가능( BottomNavigator )
* */

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

  // 상품 데이터 리스트
  final List<Map<String, String>> products = [
    {"name": "상품1", "description": "상품 1의 상세 정보"},
    {"name": "상품2", "description": "상품 2의 상세 정보"},
    {"name": "상품3", "description": "상품 3의 상세 정보"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, i) {
        final product = products[i];
        return ListTile(
          title: Text(product['name'] ?? "이름 없음"), // null 일 때 반환
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    // Material app 에서 페이지 전환 시 사용하는 위젯 (Back 버튼 제공- 에뮬레이터에서는 안나옴)
                    builder: (context) => DetailPage(
                        productName: product[
                            'name']!, // required 가 붙어 있어서 null 이 들어갈 수 없어서 null 이 아니라고 꼭 표시 !
                        //productName: product['name'] ??= "이름 없음",
                        productDescription: product['description']!)));
          },
        );
      },
    );
  }
}

// 상세 페이지
class DetailPage extends StatelessWidget {
  final String productName;
  final String productDescription;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 백 버튼 기본 제공이여서 커스텀 가능
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          productDescription,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
