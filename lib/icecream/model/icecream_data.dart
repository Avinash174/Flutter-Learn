class IcreamData {
  List<Icecreams>? icecreams;

  IcreamData({this.icecreams});

  IcreamData.fromJson(Map<String, dynamic> json) {
    if (json['icecreams'] != null) {
      icecreams = <Icecreams>[];
      json['icecreams'].forEach((v) {
        icecreams!.add(new Icecreams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.icecreams != null) {
      data['icecreams'] = this.icecreams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icecreams {
  int? id;
  String? category;
  bool? isFeatured;
  String? flavor;
  String? description;
  List<String>? toppings;
  double? price;
  String? image;
  List<Ingredients>? ingredients;

  Icecreams(
      {this.id,
      this.category,
      this.isFeatured,
      this.flavor,
      this.description,
      this.toppings,
      this.price,
      this.image,
      this.ingredients});

  Icecreams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    isFeatured = json['isFeatured'];
    flavor = json['flavor'];
    description = json['description'];
    toppings = json['toppings'].cast<String>();
    price = json['price'];
    image = json['image'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['isFeatured'] = this.isFeatured;
    data['flavor'] = this.flavor;
    data['description'] = this.description;
    data['toppings'] = this.toppings;
    data['price'] = this.price;
    data['image'] = this.image;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String? name;
  String? quantity;

  Ingredients({this.name, this.quantity});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}
