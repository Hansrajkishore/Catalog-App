import 'package:code_with_flutter/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item}):assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      child: ListTile(
        onTap: (){},
        leading: Image.network(item.image),
        title: item.name.text.black.bold.make(),
        subtitle: item.desc.text.textStyle(context.captionStyle).make(),
        trailing: "\$${item.price}".text.xl2.color(Colors.deepPurple).make(),
      ),
    );
  }
}
