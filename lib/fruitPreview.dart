import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'QuantityBadge.dart';

import 'Fruit.dart';
import 'cartProvider.dart';
import 'fruitDetailView.dart';

class FruitPreview extends StatelessWidget {
  const FruitPreview({super.key, required this.fruit});

  final Fruit fruit;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Image(image: AssetImage('./ressources/${fruit.image}'),
                  width: 50,
                  height: 50,
                ),
                Text(fruit.name),

                Text(
                    '${fruit.price} €',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                    )
                ),
              ],
            ),
            trailing:Row(
              mainAxisSize: MainAxisSize.min,
              children:[
                Consumer(builder: (context, CartProvider cartProvider, child) =>
                  QuantityBadge(qty: cartProvider.nbFruitPanierMemo(fruit))
                ),
                IconButton(onPressed: ()=>{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        FruitDetailView(
                          fruit: fruit,
                        ),
                        settings: const RouteSettings(name: 'fruitDetail'),
                        fullscreenDialog: true
                    ),
                  )
                }, icon: const Icon(Icons.search)),

                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: ()=>Provider.of<CartProvider>(context, listen: false).addPanier(fruit),
                ),
              ],
            ),

            tileColor: fruit.color,
          ),

        ],
      ),
    );
  }

}