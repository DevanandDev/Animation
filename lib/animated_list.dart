import 'package:animation_demo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListProvider>(context);
    final selected = provider.selected;
    return Scaffold(
      appBar: AppBar(title: Text('List'), centerTitle: true),
      body: ListView.builder(
        itemCount: selected.length,

        itemBuilder: (context, index) {
          final selectVal = selected[index];

          return GestureDetector(
            onTap: () {
              provider.listGenerate(index);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 5),
              margin: EdgeInsets.all(12),
              color: selectVal ? Colors.red : Colors.blue,
              height: selectVal ? 100 : 160,
              curve: Curves.easeInOut,
            ),
          );
        },
      ),
    );
  }
}
