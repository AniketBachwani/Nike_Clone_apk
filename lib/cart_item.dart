// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:currency_convertor/data.dart';
import 'package:flutter/material.dart';

import 'package:currency_convertor/Shoe.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagepath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(onPressed: removeitem, icon: const Icon(Icons.delete)),
      ),
    );
  }

  void removeitem() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }
}
