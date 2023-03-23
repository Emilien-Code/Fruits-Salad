import 'package:flutter/material.dart';

class Sort extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Padding(padding: EdgeInsets.all(8.0), child: Text('summer'))
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          child: Padding(padding: EdgeInsets.all(8.0), child: Text('winter'))
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Padding(padding: EdgeInsets.all(8.0), child: Text('spring'))
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Padding(padding: EdgeInsets.all(8.0), child: Text('automn'))
        ),
      ],
    );
  }
}