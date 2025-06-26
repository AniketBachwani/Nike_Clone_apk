import 'package:currency_convertor/Shoe.dart';
import 'package:currency_convertor/Shoetile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                //search bar
                Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Search text
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),

                        //Search icon
                        const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 18,
                ),

                //tag line
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Everyone flies.. Some fly longer than others',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),

                //Hotpicks
                const Padding(
                  padding: EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 12.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hot Picks 🔥',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),

                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    return Shoetile(
                      shoe: shoe,
                      ontap: () => addshoetocart(shoe),
                    );
                  },
                )),
              ],
            ));
  }

  void addshoetocart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                "Successfully added!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              content: Text(
                'Product is added To your cart',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ));
  }
}
