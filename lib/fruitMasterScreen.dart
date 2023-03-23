import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'Sort.dart';
import 'Fruit.dart';
import 'cartProvider.dart';
import 'cartScreen.dart';
import 'fruitPreview.dart';

class FruitMasterScreen extends StatefulWidget {
  const FruitMasterScreen({super.key, required this.title, required this.fruits});

  final String title;
  final List<Fruit> fruits;

  @override
  State<FruitMasterScreen> createState() => _FruitMasterState();

}



class _FruitMasterState extends State<FruitMasterScreen> {


  late  List<Fruit> fruits;

  @override
  void initState(){

    super.initState();
    fruits = widget.fruits;
      print(fruits);

  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer(builder: (context, CartProvider cartProvider, child) =>
                    Text('${widget.title} : ${cartProvider.totalPanier} €',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        fontFamily: 'Roboto',
                        backgroundColor: Colors.red,
                        letterSpacing: 2.0,
                        wordSpacing: 2.0,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      const CartScreen()
                      ),
                    );
                  },
                ),
              ]
          ),
        ),

        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Sort(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                              itemCount: fruits.length,
                              itemBuilder: (context, index) {
                                 return FruitPreview(fruit: fruits[index]);
                                // return Text("$index");
                              },
                            )
                  ),
                ]
            )
        )
    );
  }
}