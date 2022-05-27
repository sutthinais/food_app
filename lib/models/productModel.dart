import 'dart:convert';

class Product {
  String? name, image, location;
  double? rating, price;
  int? deliveryTime, createTime;

  Product(
      {this.name,
      this.image,
      this.location,
      this.deliveryTime,
      this.createTime,
      this.price,
      this.rating});

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json["name"],
        image: json["image"],
        location: json["location"],
        rating: json["rating"],
        price: json["price"],
        deliveryTime: json["deliveryTime"],
        createTime: json["createTime"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "location": location,
        "rating": rating,
        "price": price,
        "deliveryTime": deliveryTime,
        "createTime": createTime
      };
}

// {
// "name": "กาแฟดำอร่อย",
// "image": "assets/images/medium_1.png",
// "location": "ร้านชวนชมชิม",
// "rating": 4.6,
// "deliveryTime": 25,
// "createTime": 25,
// "price":55.5
// },
