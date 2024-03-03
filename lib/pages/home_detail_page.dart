import 'dart:async';

import 'package:code_with_flutter/models/cart.dart';
import 'package:code_with_flutter/models/catalog.dart';
import 'package:code_with_flutter/utils/Routes.dart';
import 'package:code_with_flutter/widgets/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog}) : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

  bottomNavigationBar: Container(

    color: Theme.of(context).colorScheme.background,

    child: ButtonBar(
      buttonPadding: EdgeInsets.zero,
      alignment: MainAxisAlignment.spaceBetween,
      children: [
            "₹ ${catalog.price}".text.red800.xl3.make(),
            AddToCartDetail(catalog: catalog).wh(100, 50),
      ],
    ).px32().py16(),
  ),

      body: SafeArea(

        bottom: false,

          child: Column(
            children: [
              30.heightBox,
              Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image ,width: double.infinity, height: 300,)).h32(context),
              30.heightBox,





              Expanded(
                  child: VxArc(
                height: 30,
                edge: VxEdge.top,
                arcType: VxArcType.convey,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    color: context.cardColor,
                    child: Column(
                      children: [
                        10.heightBox,

                          catalog.name.text.bold.color(context.theme.shadowColor).xl3.makeCentered(),
                        Column(
                          children: [
                            Card(color: context.cardColor,
                                elevation:0.0,child: catalog.desc.text.textStyle(context.captionStyle).color(context.theme.shadowColor).xl.makeCentered().p16()),
                          ],
                        ),
                        20.heightBox,
                        Image.network(catalog.icons , height: 50 ,),
                      ],
                    ).py32(),
                  ),
                ),
              ))

            ],
          ),
        ),

    );
  }
}
class AddToCartDetail extends StatefulWidget {
  final Item catalog;
  const AddToCartDetail({super.key, required this.catalog});

  @override
  State<AddToCartDetail> createState() => _AddToCartDetailState();
}

class _AddToCartDetailState extends State<AddToCartDetail> {
  @override
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () async {
          if(!isAdded) {
            isAdded = isAdded.toggle();
            final catalog = CatalogModel();

            _cart.catalog = catalog;
            _cart.add(widget.catalog);

            setState(() {

            });
          }
         await Future.delayed(Duration(milliseconds: 350));
         await Navigator.pushNamed(context, MyRoutes.cartPage);
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.hoverColor)),
        child: "Buy".text.white.makeCentered()
    );
  }
}



