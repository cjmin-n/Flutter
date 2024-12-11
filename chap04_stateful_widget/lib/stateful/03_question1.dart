import 'package:flutter/material.dart';

class ListViewWrap extends StatefulWidget {
  const ListViewWrap({super.key});

  @override
  State<ListViewWrap> createState() => _ListViewWrapState();
}

class _ListViewWrapState extends State<ListViewWrap> {
  List<int> numList = [0, 0, 0];
  List<String> titleList = ["피자", "돈까스", "치킨"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Text(numList[i].toString()),
            title: Text(titleList[i]),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  numList[i]++;
                });
              },
              child: Text("좋아용"),
            ),
          );
        }
    );
  }
}
