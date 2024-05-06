import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  //Add shoe to cart methode
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemCart(shoe);

    //Dialog Box

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added"),
        content: Text("Check your Cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: TextStyle(),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ),
          //messege
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text(
              "Everyone flies.. some fly longer then other",
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ),
          //Most Pick
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                return shoeTile(
                  shoe: shoe,
                  onTap: ()=>addShoeToCart(shoe),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }
}
