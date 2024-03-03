import 'package:code_with_flutter/models/cart.dart';
import 'package:code_with_flutter/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ?? false;
    return TextButton(
        onPressed: () {
          if(!isAdded) {
            isAdded = isAdded.toggle();
            final catalog = CatalogModel();

            _cart.catalog = catalog;
            _cart.add(widget.catalog);

            setState(() {

            });
          }
        },
        child: isAdded?Icon(Icons.done) :Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}
