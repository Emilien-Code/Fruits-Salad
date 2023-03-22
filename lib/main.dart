//lien api fruit : https://fruits.shrp.dev/items/fruits

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartProvider.dart';
import 'fruitMasterScreen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const FruitMasterScreen(
        title: 'Panier de fruits',
      ),
    );
  }
}


