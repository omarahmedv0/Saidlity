class ProductModel {
  String? id;
  String? name;
  String? price;
  String? count;
  String? image;
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
  });

  ProductModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    count = json['count'];
  }
}
