class Product {
  int? _id;
  String? _name;
  String? _description;
  String? _image;
  double? _price;
  int? _quantity;
  double? _ratting;
  int? _reviewCount;


  Product(
      {int? id,
        String? name,
        String? description,
        String? image,
        double? price,
        int? quantity,
        double? ratting,
        int? reviewCount,

        }) {
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _price = price;
    _quantity = quantity;
    _ratting = ratting;
    _reviewCount =reviewCount;

  }

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;
  double? get price => _price;
  int? get quantity => _quantity;
  double? get ratting => _ratting;
  int? get reviewCount => _reviewCount;


  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    if(json['price'] != null){
      _price = json['price'].toDouble();
    }else{
      _price = 0;
    }

    _quantity = json['quantity'];
    _ratting = json['ratting'];
    _reviewCount = json['reviewCount'];

    }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['description'] = _description;
    data['image'] = _image;
    data['price'] = _price;
    data['quantity'] = _quantity;
    data['ratting'] = _ratting;
    data['reviewCount'] = _reviewCount;

    return data;
  }
}