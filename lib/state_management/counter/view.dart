import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
   CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$count'),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              count++;
              setState(() {

              });
            }, icon: Icon(Icons.add),),
            IconButton(onPressed: () {
              count--;
              setState(() {

              });
            }, icon: Icon(Icons.remove),),
          ],
        ),
        ],
      ),
    );
  }
}
