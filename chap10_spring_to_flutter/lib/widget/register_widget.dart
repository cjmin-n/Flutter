import 'package:chap10_spring_to_flutter/model/menu_model.dart';
import 'package:flutter/material.dart';

class MenuRegister extends StatefulWidget {
  const MenuRegister({super.key});

  @override
  State<MenuRegister> createState() => _MenuRegisterState();
}

class _MenuRegisterState extends State<MenuRegister> {
  final MenuModel _menuModel = MenuModel();
  dynamic _menu;

  TextEditingController _menuNameController = TextEditingController();
  TextEditingController _menuPriceController = TextEditingController();
  TextEditingController _categoryCodeController = TextEditingController();
  TextEditingController _orderableStatusController = TextEditingController();

  void _registMenu() async {
    Map<String, dynamic> menuData = {
      'menuName': _menuNameController.text,
      'menuPrice': int.parse(_menuPriceController.text),
      'categoryCode': int.parse(_categoryCodeController.text),
      'orderableStatus': _orderableStatusController.text
    };

    try {
      String result = await _menuModel.insertMenu(menuData);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result)));
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _menuNameController,
            decoration: InputDecoration(labelText: "메뉴 이름"),
          ),
          TextField(
            controller: _menuPriceController,
            decoration: InputDecoration(labelText: "메뉴 가격"),
          ),
          TextField(
            controller: _categoryCodeController,
            decoration: InputDecoration(labelText: "카테고리 코드"),
          ),
          TextField(
            controller: _orderableStatusController,
            decoration: InputDecoration(labelText: "판매 여부"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _registMenu, child: Text("메뉴 등록하기"))
        ],
      ),
    );
  }
}
