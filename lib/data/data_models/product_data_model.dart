class ProductDataModel{
  String? name;
  String? description;
  double? price;
  String? imageURL;
  ProductDataModel({
    this.name,
    this.description,
    this.price,
    this.imageURL,
});
  factory ProductDataModel.fromMapJason(Map<String,dynamic> map){
    return ProductDataModel(
      name: map['title'],
      imageURL: map['thumbnail'],
      price: map['price'],
      description: map['description']
    );
  }
}