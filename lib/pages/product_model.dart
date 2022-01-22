class Product{
  String name;
  String type;
  String cost;
  String image;
  bool isLike = false;
  String category;

  Product({required this.name, required this.type, required this.cost, required this.image, required this.category});

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return other is Product && image == other.image;
  }

  @override
  int get hashCode => image.hashCode;

}