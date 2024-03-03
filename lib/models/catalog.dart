class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();

  factory CatalogModel() => catModel;
   static List<Item> items = [];
   Item getById(int id)=> items.firstWhere((element) => element.id == id, orElse: null);
   Item getByPostition(int pos)=> items[pos];
}
class Item{
  final num id;
  final String icons;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id,required this.icons, required this.name, required this.desc,
    required this.price, required this.color, required this.image});

factory Item.fromMap(Map<String , dynamic>map){
 return Item(
    id: map["id"],
    icons: map["icons"],
    name: map["name"],
    desc: map["desc"],
    price: map["price"],
    color: map["color"],
    image: map["image"],
  );
}

toMap()=>{
  "id" : id,
  "icons" : icons,
  "name" : name,
  "desc" :desc,
  "price" : price,
  "color" : color,
  "image" : image,
};
}