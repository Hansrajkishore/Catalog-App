import 'package:code_with_flutter/models/cart.dart';
import 'package:code_with_flutter/models/catalog.dart';
import 'package:code_with_flutter/pages/home_detail_page.dart';
import 'package:code_with_flutter/pages/home_page.dart';
import 'package:code_with_flutter/utils/Routes.dart';
import 'package:code_with_flutter/widgets/add_to_cart.dart';
import 'package:code_with_flutter/widgets/drawer.dart';
import 'package:code_with_flutter/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  late final Item _catalog;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  bool isAdded = false;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.hoverColor,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPage);
        },
        child: Icon(CupertinoIcons.cart),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.theme.shadowColor),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: "Catalog App"
            .text
            .bold
            .xl3
            .color(context.theme.shadowColor)
            .make()
            .centered(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                itemCount: CatalogModel.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return InkWell(
                    onLongPress: () {
                      isAdded = isAdded.toggle();

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "${item.name} Added To Cart".text.make(),
                      ));
                      setState(() {});
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeDetailPage(catalog: item),
                          ));
                    },
                    child: Card(
                      shape: Border(
                        top: BorderSide(color: Colors.red),
                        left: BorderSide(color: Colors.indigo),
                      ),
                      shadowColor: Colors.grey.shade400,
                      color: context.cardColor,
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: GridTile(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            10.heightBox,
                            Container(
                                // margin: EdgeInsets.only(bottom: 10),
                                // padding: EdgeInsets.all(20),
                                child: Hero(
                                    tag: Key(item.id.toString()),
                                    child: Image.network(
                                      item.image,
                                      height: 90,
                                    ))),
                            2.heightBox,
                            item.name.text.bold
                                .color(context.theme.shadowColor)
                                .make()
                                .centered(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // 5.widthBox,
                                "\t\t\t₹ ${item.price}"
                                    .text
                                    .bold
                                    .color(context.theme.shadowColor)
                                    .make()
                                    .centered(),
                                AddToCart(
                                  catalog: item,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
