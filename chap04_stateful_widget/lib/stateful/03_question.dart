/*
import 'package:flutter/material.dart';

class ListViewWrap extends StatelessWidget {
  ListViewWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i){
          return ItemBuilder();
        },
    );
  }
}


class ItemBuilder extends StatefulWidget {
  const ItemBuilder({super.key});
  @override
  State<ItemBuilder> createState() => _ItemBuilderState();
}

class _ItemBuilderState extends State<ItemBuilder> {
  var a = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(a.toString()),
      title: Text(""),
      trailing: ElevatedButton(
          onPressed: (){
            setState(() {
              print(a);
              a++;
            });
          },
          child: Text("좋아용"),
      ),
    );
  }
}

*/
