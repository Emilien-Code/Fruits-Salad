import 'package:flutter/material.dart';

class QuantityBadge extends StatelessWidget {
  const QuantityBadge({required this.qty});
  final String qty;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Padding(padding: EdgeInsets.all(8.0), child: Text('${qty}'))
    );
  }
}