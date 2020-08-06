class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String imageUrl;
  bool isFavorite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.image,
      this.imageUrl,
      this.isFavorite});
}
