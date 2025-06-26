import 'package:currency_convertor/Shoe.dart';
import 'package:currency_convertor/cart_item.dart';
import 'package:currency_convertor/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              const Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
            
            const SizedBox(height: 10,),

            Expanded(child: ListView.builder
            (itemCount: value.userCart.length,
              itemBuilder: (context,index){
              
              //get your shoe
              Shoe singleshoe = value.userCart[index];
              //return the cart item
              return CartItem(shoe: singleshoe,);
            })
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("₹${value.returnTotal()}",style: const TextStyle(color: Colors.green,fontSize: 16),),
                  ElevatedButton.icon(onPressed: (){
                    showDialog(
                      context: context,
        builder: (context) => const AlertDialog(
                                    backgroundColor: Colors.black,
                                    title: Text(
                                      "Buying Not Supported",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    content: Text(
                                      'Pagal hai kya bhai real app thodi hai',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                    );
                  }, label: const Text("Buy"))
                ],
              ),
            )

            ],
        ),
      ),
    );
  }
}
