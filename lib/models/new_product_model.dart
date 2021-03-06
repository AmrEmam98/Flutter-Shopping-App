
class NewProductModel {
  String id;
  CategoryType catType;
  String title, model, imgUrl, description, colorLabel;
  double price, rate;
  Map<String, dynamic> productSpecs;
  bool inCart, isFavourite;

  NewProductModel(
      {this.id,
      this.catType,
      this.title,
      this.description,
      this.model,
      this.price,
      this.imgUrl,
      this.colorLabel,
      this.rate,
      this.isFavourite = false,
      this.inCart = false,
      this.productSpecs});
}

enum CategoryType { Clothes, Mobile ,All,Furniture,Baby,Fashion}

