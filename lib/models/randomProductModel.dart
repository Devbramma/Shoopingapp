class Product {
  final int id;
  final String title;
  final String brand;
  final String image;
  final String image2;
  final String image3;
  final String image4;
  final String price;
  final String gender;
  final String number;
  final List<String> size;
  final String description;
  bool isAddedToCart;

  Product( {
    required this.id,
    required this.title,
    required this.brand,
    required this.image,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.price,
    required this.gender,
    required this.number,
    required this.size,
    required this.description,
    this.isAddedToCart=false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        brand: json['brand'],
        image: json['image'],
        image2: json['image2'],
        image3: json['image3'],
        image4: json['image4'],
        price: json['price'],
        gender: json['gender'],
        number: json['number'],
        size: List<String>.from(json['size']),
        description: json['description']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'brand': brand,
        'image': image,
        'image2': image2,
        'image3': image3,
        'image4': image4,
        'price': price,
        'gender': gender,
        'size': size,
        'number': number,
        'description': description,
      };


}

class ProductList {
  final List<Product> products;
  ProductList({required this.products});
  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> productList =
        json.map((productJson) => Product.fromJson(productJson)).toList();

    return ProductList(products: productList);
  }
}
