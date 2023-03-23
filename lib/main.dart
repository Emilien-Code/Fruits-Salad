//lien api fruit : https://fruits.shrp.dev/items/fruits

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Fruit.dart';
import 'cartProvider.dart';
import 'fruitMasterScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  MyApp({super.key});



  final List<Fruit> fruits = [];

  Future<List<Fruit>> fetchApi () async {
    final response = await http.get(Uri.parse('https://fruits.shrp.dev/items/fruits?fields=*.*'));
    // List<Fruit> fruits = [];


    if(response.statusCode == 200 || response.statusCode == 304){
      final fruitList = jsonDecode(response.body);
      var ft = fruitList['data'].map<Fruit>((fruit) => Fruit.fromJson(fruit));

      fruits.addAll(ft.toList());

    }
    else{
      throw Exception('Erreur de chargement API');
    }

    return fruits;

  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit salad',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FutureBuilder(
        future: fetchApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  FruitMasterScreen(
              title: 'Panier de fruits',
              fruits: fruits,
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text('Erreur de chargement des fruits'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
}



