import 'package:chap10_spring_to_flutter/model/menu_model.dart';
import 'package:flutter/material.dart';

class MenuDelete extends StatefulWidget {
  const MenuDelete({super.key});

  @override
  State<MenuDelete> createState() => _MenuDeleteState();
}

class _MenuDeleteState extends State<MenuDelete> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];
  dynamic _selectedMenu;

  void _loadMenus() async {
    List<dynamic> menus = await _menuModel.searchMenu();

    setState(() {
      _menus = menus;
    });
  }

  void _deleteMenu() async {
    try {
      String result = await _menuModel.deleteMenu(_selectedMenu);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result)));
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : $e')));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton(
            value: _selectedMenu,
            hint: Text("메뉴 선택"),
            items: _menus.map((dynamic menu) {
              return DropdownMenuItem(
                value: menu,
                child: Text(menu['menuName']),
              );
            }).toList(),
            onChanged: (dynamic newValue) {
              setState(() {
                _selectedMenu = newValue;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _deleteMenu, child: Text("메뉴 삭제하기"))
        ],
      ),
    );
  }
}
