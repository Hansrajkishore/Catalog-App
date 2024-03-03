
import 'package:code_with_flutter/models/cart.dart';
import 'package:code_with_flutter/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.background,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            
            "₹ ${_cart.totalPrice}".text.xl4.color(Colors.red).make(),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.hoverColor)),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Yet Not Implemented".text.color(Colors.white).makeCentered()));
            }, child: 'Buy'.text.color(Colors.white).make())
          ],
        )
      ).px32().py12(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.theme.shadowColor),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
        title: "Cart".text.bold.xl3.color(context.theme.shadowColor).makeCentered(),
      ),
      body: _CartList(),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: IconButton(
          icon:  Icon(Icons.done , color: context.theme.shadowColor,), onPressed: () {  },
        ),
        title: _cart.items[index].name.text.color(context.theme.shadowColor).make(),
        trailing: IconButton(
          icon:  Icon(Icons.delete , color: context.theme.shadowColor,), onPressed: () {
            _cart.remove(_cart.items[index]);
            setState(() {

            });
        },
        ),
      ),
      itemCount: _cart.items?.length,

    ).p8().expand();
  }
}

