import 'package:chap10_spring_to_flutter/model/menu_model.dart';
import 'package:flutter/material.dart';

import 'detail_widget.dart';

class MenuSelect extends StatefulWidget {
  const MenuSelect({super.key});

  @override
  State<MenuSelect> createState() => _MenuSelectState();
}

class _MenuSelectState extends State<MenuSelect> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  // 메뉴 목록을 불러오는 함수
  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();

    setState(() {
      _menus = menuData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _menus.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(_menus[i]["menuName"]),
            subtitle: Text(_menus[i]["menuPrice"].toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(menus: _menus[i])));
            },
          );
        });
  }
}
