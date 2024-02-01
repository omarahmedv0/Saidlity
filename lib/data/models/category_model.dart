class CategoryModel {
  String? id;
  String? name;
  String? image;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });
  CategoryModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
