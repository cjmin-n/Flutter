import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final dynamic menus;
  const DetailPage({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    String menuName = menus["menuName"];
    int menuPrice = menus["menuPrice"];
    int categoryCode = menus["categoryCode"];
    String orderableStatus = menus["orderableStatus"];

    return Scaffold(
      appBar: AppBar(
        title: Text(menuName),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "메뉴이름 : $menuName",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("가격 : $menuPrice"),
          Text("카테고리 코드 : $categoryCode"),
          Text("주문 가능 상태 : $orderableStatus")
        ],
      ),
    );
  }
}
